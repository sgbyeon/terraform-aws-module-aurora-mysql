resource "aws_rds_cluster" "this" {
  cluster_identifier = format("%s-%s", var.prefix, var.cluster_name)
  db_subnet_group_name = aws_db_subnet_group.this.name

  engine = var.engine
  engine_version = var.engine_version
  engine_mode = var.engine_mode

  availability_zones = var.azs

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      availability_zones
    ]
  }

  database_name = var.database_name
  master_username = var.master_username
  master_password = var.master_password

  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window

  deletion_protection = var.deletion_protection
  skip_final_snapshot = var.skip_final_snapshot
  kms_key_id = format("arn:aws:kms:%s:%s:key/%s", var.region, var.account_id, var.kms_key_id)
  storage_encrypted = var.storage_encrypted

  depends_on = [
    aws_db_subnet_group.this
  ]

  tags = merge(var.tags, tomap({Name = format("%s.%s.aurora", var.prefix, var.cluster_name)}))
}

resource "aws_rds_cluster_instance" "this" {
  count = var.replica_count

  identifier = format("%s-%s-aurora-%s", var.prefix, var.cluster_name, "${count.index}")
  cluster_identifier = aws_rds_cluster.this.id
  db_subnet_group_name = aws_db_subnet_group.this.name

  instance_class = var.instance_class

  engine = aws_rds_cluster.this.engine
  engine_version = aws_rds_cluster.this.engine_version

  tags = merge(var.tags, tomap({Name = format("%s.%s.aurora-%s", var.prefix, var.cluster_name, "${count.index}")}))

  depends_on = [
    aws_rds_cluster.this
  ]
}

resource "aws_db_subnet_group" "this" {
  name = format("%s.%s.aurora.subnet-groups", var.prefix, var.cluster_name)
  subnet_ids = var.subnet_ids

  tags = merge(var.tags, tomap({Name = format("%s.%s.aurora.subnet-groups", var.prefix, var.cluster_name)}))
}