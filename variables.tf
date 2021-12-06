variable "aws_region" {
  description = "The AWS region to deploy the resources into"
  type = string
  default = "eu-central-1"
}

variable "aws_account_id" {
  description = "The AWS account identifier of the project"
  type = string
  default = "12343567891234"
}

variable "prefix" {
  description = "The resource prefix"
  type = string
  default = "alf-dev-con1"
}



locals {
  iot_policy_allowall = "${var.prefix}-allowall"
  iot_policy_con1 = "${var.prefix}-con1"
  
  thing_name_pi0_simulated = "${var.prefix}-pi0-simulated"
  thing_name_pi1 = "${var.prefix}-pi1"
  
}
