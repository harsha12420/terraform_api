
#Create VPC

variable "region" {
    type = string
    default = "us-east-1"
}

variable "vpc_name" {
    type = string
    default = "demo-vpc"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "public_subnet_az1_cidr" {
    type = string
    default = "10.0.1.0/24"
}


variable "public_subnet_az2_cidr" {
    type = string
    default = "10.0.2.0/24"
}

variable "private_subnet_az1_cidr" {
    type = string
    default = "10.0.10.0/24"
}


variable "private_subnet_az2_cidr" {
    type = string
    default = "10.0.11.0/24"
}

# Security Group for vpc
variable "security_group_name" {
  type = string
  default = "mysg0001"
}

# EC2
variable "ec2_ami" {
  type = string
  default = "ami-08d4ac5b634553e16"
}
variable "ec2_type" {
  default = "t2.micro"
}

variable "ec2_name" {
  type = string
  default = "myec2420"
}
variable "key_name" {
    description = "SSH keys to connect to ec2 instance"
    default = "n.vir"
}


# Create RDS

variable "allocated_storage" {
  type = string
  default = "20"
}

variable "db_engine" {
  type = string
  default = "mysql"
}

variable "engine_version" {
  type = string
  default = "8.0.28"
}

variable "instance_class" {
  type = string
  default = "db.t2.micro"
}

variable "db_name" {
  type = string
  default = "my_RDS_database"
}

variable "username" {
  type = string
  default = "harsha"
}

variable "password" {
  type = string
  default = "harsha12420"
}

variable "skip_final_snapshot" {
  type = bool
  default = "true"
}

variable "db_subnet_group_name" {
  type = string
  default = "rds_database_subnet"
}

variable "subnet_group_tag" {
  type = string
  default = "rds_databse_saabnet"
}

#S3 Bucket
variable "bucket_name" {  
  type        = string  
  default = "harshapatel0099"
} 

variable "bucket_tag" {  
  type        = string  
  default = "harshapatel.ml"
} 

# Cert Manager
variable "wild_domain_name" {  
  type        = string  
  default = "*.harshapatel.ml"
}
variable "w_domain_name" {  
  type        = string  
  default = "www.harshapatel.ml"
}
variable "cert_managertag" {  
  type        = string  
  default = "harshapatel.ml-certmanager"
}
/* variable "type" { 
  type    = string
  default = "A"
 } */
# Route 53
variable "domain_name" {  
  type        = string  
  default = "harshapatel.ml"
} 
# Iam Role

variable "accountId" {
  description = "AWS Account ID"
  default = "8304-2669-6658"
}

# Lambda 
variable "lambda_role_name" {
  description = "Lambda IAM Role Name"
  default = "lambdaRole"
}

variable "filename" {
  description = "lambda function file name"
  default = "lambda.zip"
  type = string
}

variable "function_name" {
  default = "my_function"
  description = "lambda function name"
  type = string
}

variable "handler" {
  default = "lambda.lambda_handler"
  description = "Lambda function handler"
  type = string
}

variable "runtime" {
  default = "python3.7"
  description = "Lambda function runtime"
  type = string
}

variable "statement_id" {
  default = "AllowExecutionFromAPIGateway"
  description = "IAM statement ID"
}

variable "action" {
  default = "lambda:InvokeFunction"
  description = "IAM Lambda Description"
}

variable "principal" {
  default = "apigateway.amazonaws.com"
  description = "IAM Lambda Principal"
}

# API Gateway

variable "api_name" {
  default = "myapi"
  description = "API Name"
  type =  string
}

variable "api_path_part" {
  default = "resource"
  description = "value"
  type = string
}

variable "api_http_method" {
  default = "GET"
  description = "Api gateway method"
  type = string
}

variable "api_authorization" {
  default = "NONE"
  description = "API Gateway Authorization"
  type =  string
}

variable "api_integration_http_method" {
  default = "POST"
  description = "API HTTP method integration"
}

variable "api_type" {
  default = "AWS_PROXY"
  description = "API GW Integration type"
}

