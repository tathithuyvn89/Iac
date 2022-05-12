////////////////////envicroment information////////////////////////////////////////////
/////////DEV: 10.110.0.0/16, UAT: 10.104.0.0/16, PROD: 10.105.0.0/16  /////////////////
aws_account   = "434839081440" //ID 12 digits AWS account
environment   = "PROD"
aws_region    = "us-east-1"
vpc_cidr      = "10.110.0.0/16"
default_allow_subnets_cidr = []

/////////////////////////////---------VPC_UAT_EFINANCE-----------///////////////////////////////////
public_subnets_cidr  = ["10.110.0.0/24", "10.110.1.0/24"]
private_subnets_cidr = ["10.110.2.0/24", "10.110.3.0/24"]
db_subnets_cidr      = ["10.110.4.0/24", "10.110.5.0/24"]