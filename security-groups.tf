resource "aws_db_security_group" "this" {
  name = format("%s-%s-aurora-security-groups", var.prefix, var.cluster_name)

  ingress {
    cidr = var.cidr
    security_group_name = var.security_group_name
  }

  tags = merge(var.tags, tomap({Name = format("%s.%s.aurora.security-groups", var.prefix, var.cluster_name)}))
}