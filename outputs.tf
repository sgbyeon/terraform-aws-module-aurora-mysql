output "account_id" {
  description = "AWS Account ID"
  value = var.account_id
}

output "region" {
  description = "AWS region"
  value = var.region
}

output "subnet_ids" {
  description = "RDS Aurora Subnet List"
  value = aws_db_subnet_group.this.subnet_ids
}