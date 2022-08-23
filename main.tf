# configure aws provider
#provider "aws"  {
  #  region = var.region
#}


variable "aws_region" {
  description = "AWS default region."
  type =  string
  default     = "us-east-1"
}

module "vpc" {
  source                  = "./modules/vpc"
  region                  = var.region 
  vpc_name                = var.vpc_name
  vpc_cidr                = var.vpc_cidr
  public_subnet_az1_cidr  = var.public_subnet_az1_cidr
  public_subnet_az2_cidr  = var.public_subnet_az2_cidr
  private_subnet_az1_cidr = var.private_subnet_az1_cidr
  private_subnet_az2_cidr = var.private_subnet_az2_cidr
  security_group_name     = var.security_group_name
}

# create EC2
module "ec2" {
  source = "./modules/ec2"
  subnet_id = module.vpc.public_subnet_az1
  ec2_ami = var.ec2_ami
  ec2_type = var.ec2_type
  ec2_security_group_id = module.vpc.ec2_security_group_id
  ec2_name = var.ec2_name
  key_name        = var.key_name



}

/*#Create RDS
module "rds" {
  source = "./modules/rds"
  subnet_id_az1 = module.vpc.public_subnet_az1
  subnet_id_az2 = module.vpc.public_subnet_az2
  allocated_storage = var.allocated_storage
  engine = var.db_engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  db_name = var.db_name
  username = var.username
  password = var.password
  db_subnet_group_name = var.db_subnet_group_name
  subnet_group_tag = var.subnet_group_tag
  skip_final_snapshot = var.skip_final_snapshot
}


# Route 53
module "route53" {
  source ="./modules/route53"
    domain_name = var.domain_name
}

#S3 bucket 
module "s3" {
  source ="./modules/s3"
  bucket_name = var.bucket_name
  bucket_tag = var.bucket_tag
}
# Cert Manager
module "certmanager" {
  source ="./modules/certmanager"
  wild_domain_name = var.wild_domain_name
  w_domain_name = var.w_domain_name
  cert_managertag = var.cert_managertag
  hosted_zone_id = module.route53.hosted_zone_id

 
}
### CloudFront
module "cloudfront" {
  source ="./modules/cloudfront"
  bucket_domain_name = module.s3.bucket_domain_name
  viewer_certificate_arn = module.certmanager.aws_acm_certificate_arn
  depends_on = [
    module.certmanager
  ]
}*/
### iam role
module "iam" {
  source = "./modules/iam"

  lambda_role_name = var.lambda_role_name
  #eks-role-policy = var.aws_iam_role_policy_attachment
}

### Api gateway
module "apigw" {
  source = "./modules/api_gateway"

  api_authorization = var.api_authorization
  api_integration_http_method = var.api_integration_http_method
  api_http_method = var.api_http_method
  api_name = var.api_name
  api_path_part = var.api_path_part
  api_type = var.api_type

  statement_id  = var.statement_id
  action        = var.action
  principal     = var.principal
  function_name = module.lambda.lambda_function
  accountId     = var.accountId
  aws_region    = var.aws_region

  depends_on = [
    module.lambda
  ]
}

module lambda{
   source = "./modules/lambda"

    lambdaRole    = module.iam.lambdaRole
    filename      = var.filename
    function_name = var.function_name
    handler       = var.handler
    runtime       = var.runtime

   depends_on = [
     module.iam
   ]
}
