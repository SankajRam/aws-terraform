output "aws_region" {
  description = "Region Deployed in"
  value       = var.aws_region
}
output "vpc_id" {
  description = "ID of the VPC "
  value       = module.vpc.vpc_id
}
output "subnet_ids" {
  value = tomap({
    for k, subnet in aws_subnet.subnets : k => subnet.id
  })
}
