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