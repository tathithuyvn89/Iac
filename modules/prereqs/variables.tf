variable "environment" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "aws_account" {
  type = string
}



variable "subscriptions" {
  description = "List of telephone numbers to subscribe to SNS."
  type        = list
  default     = []
}