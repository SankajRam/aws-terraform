variable "eg_environment" {
  description = "Dev, Test, QA, Staging, Prod, ECV3 etc. to determine env specific config to use"
  type        = string
  default     = "it-sunnyvale"
}
variable "aws_region" {
  description = "Value of the aws region"
  type        = string
}
variable "vpc_name" {
  description = "Value of the Name tag for the VPC"
  type        = string
}
variable "vpc_cidr" {
  description = "VPC CIDR range"
  type        = string
}
variable "vpc_azs" {
  description = "VPC AZs to cover"
  type        = list(string)
}
 
