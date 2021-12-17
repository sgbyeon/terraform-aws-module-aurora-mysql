output "subnet_list" {
  description = "RDS Aurora Subnet List"
  value = aws_db_subnet_group.this.subnet_ids
}