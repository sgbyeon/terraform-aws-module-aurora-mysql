variable "region" {
  description = "AWS Region"
  type = string
  default = ""
}

variable "account_id" {
  description = "List of Allowed AWS account IDs"
  type = string
  default = ""
}

variable "prefix" {
  description = "prefix for aws resources and tags"
  type = string
}

variable "cluster_name" {
  description = "RDS Aurora Cluster Name"
  type = string
}

variable "engine" {
  description = "RDS Aurora Engine Name"
  type = string
}

variable "engine_version" {
  description = "RDS Aurora Engine Version"
  type = string
}

variable "engine_mode" {
  description = "RDS Aurora Engine Mode"
  type = string
}

variable "azs" {
  description = "Availability Zone List"
  type = list(string)
}

variable "database_name" {
  description = "RDS Aurora Database Name"
  type = string
}

variable "master_username" {
  description = "RDS Aurora Master User Name"
  type = string
}

variable "master_password" {
  description = "RDS Aurora Master User Password(cli only)"
  type = string
}

variable "port" {
  description = "RDS Aurora PostgreSQL Port"
  type = string
}

variable "backup_retention_period" {
  description = "RDS Aurora Database Backup Period"
  type = string
}

variable "preferred_backup_window" {
  description = "RDS Aurora Database Backup Start Time for Daily"
  type = string
}

variable "preferred_maintenance_window" {
  description = "RDS Aurora Maintenance Window"
  type = string
}

variable "subnet_ids" {
  description = "Subnet list for RDS Aurora"
  type = list(string)
}

variable "replica_count" {
  description = "RDS Aurora Multi AZ"
  type = string
}

variable "instance_class" {
  description = "RDS Aurora Intance Type"
  type = string
}

variable "deletion_protection" {
  description = "RDS Aurora Deletion Protection"
  type = bool
}

variable "skip_final_snapshot" {
  description = "RDS Aurora Final Snapshot Skip"
  type = bool
}

variable "kms_key_id" {
  description = "kms key"
  type = string
}

variable "storage_encrypted" {
  description = "aurora rds encrypted using kms"
  type = bool
  default = true
}

variable "tags" {
  description = "tag map"
  type = map(string)
}

variable "cidr" {
  description = "The CIDR block to accept"
  type = string
  default = ""
}