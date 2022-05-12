terraform {
  backend "s3" {
    bucket         = "dev0001-s3-terraform-backend"
    key            = "state"
    region         = "us-east-1"
    encrypt        = true
    role_arn       = "arn:aws:iam::434839081440:role/DEV0001S3BackendRole"
    dynamodb_table = "DEV0001-s3-backend"
  }
}

module "dynamodb" {
  source        = "./modules/dynamodb"
  environment   = var.environment
}

module "prereqs" {
  source        = "./modules/prereqs"
  aws_region    = var.aws_region
  environment   = var.environment
  aws_account   = var.aws_account
}
module "iam" {
  source        = "./modules/iam"
  aws_region    = var.aws_region
  environment   = var.environment
  aws_account   = var.aws_account
  dynamodb_arn  = module.dynamodb.dynamodb_arn
  s3_bucket_arn = module.prereqs.s3_bucket_arn
}