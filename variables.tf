variable "name" {
  description = "Application name (Examples: DPXN, MYPAYCENTER)"
  type        = string
  default     = ""
}


variable "app_environment" {
  description = "Application environment (Examples: dev, nonprod, prod)"
  type        = string
}

variable "infra_environment" {
  description = "Environment for the infrastructure equivalent to Chef Environment (Examples: dpxn-production, mypaycenter-dev)"
  type        = string
}

variable "engine" {
  description = "The database engine to use. Examples: aurora, aurora-mysql, aurora-postgresql, mariadb, mysql, oracle-ee, oracle-ee-cdb, oracle-se2, oracle-se2-cdb, postgres, sqlserver-ee, sqlserver-se, sqlserver-ex, sqlserver-web"
  type        = string
  default     = null
}

variable "engine_mode" {
  description = "The database engine mode. Valid values: `global`, `multimaster`, `parallelquery`, `provisioned`, `serverless`. Defaults to: `provisioned`"
  type        = string
  default     = "provisioned"
}

variable "engine_version" {
  description = "The engine version to use. If auto_minor_version_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10)"
  type        = string
  default     = null
}

variable "master_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
  default     = null
}

variable "master_username" {
  description = "Username for the master DB user"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default     = ""
}

variable "db_subnet_group_name" {
  description = "The name of the subnet group name (existing or created)"
  type        = string
  default     = ""
}

variable "enabled_cloudwatch_logs_exports" {
  description = "Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine). MySQL and MariaDB: audit, error, general, slowquery. PostgreSQL: postgresql, upgrade. MSSQL: agent , error. Oracle: alert, audit, listener, trace."
  type        = list(string)
  default     = []
}

variable "availability_zones" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted"
  type        = list(string)
  default     = null
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs"
  type        = number
  default     = null
}

variable "db_cluster_db_instance_class" {
  description = "The compute and memory capacity of each DB instance in the Multi-AZ DB cluster, for example db.m6g.xlarge. Not all DB instance classes are available in all AWS Regions, or for all database engines"
  type        = string
  default     = null
}

variable "iops" {
  description = "The amount of Provisioned IOPS (input/output operations per second) to be initially allocated for each DB instance in the Multi-AZ DB cluster"
  type        = number
  default     = 2000
}

variable "deletion_protection" {
  description = "deletion protection Multi-AZ DB cluster"
  type        = bool
  default     = null
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. When specifying `kms_key_id`, `storage_encrypted` needs to be set to `true`"
  type        = string
  default     = null
}

variable "subnets" {
  description = "List of subnet IDs used by database subnet group created"
  type        = list(string)
  default     = []
}

variable "storage_type" {
  description = "The source region for an encrypted replica DB cluster"
  type        = string
  default     = "io1"
}

variable "source_region" {
  description = "The source region for an encrypted replica DB cluster"
  type        = string
  default     = null
}

variable "skip_final_snapshot" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted"
  type        = bool
  default     = true
}

variable "apply_immediately" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted"
  type        = bool
  default     = true
}

variable "backup_retention_period" {
  description = "The days to retain backups for. Must be between 0 and 35"
  type        = number
  default     = null
}

variable "storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted. The default is `true`"
  type        = bool
  default     = true
}

variable "performance_insights_enabled" {
  description = "Specifies whether Performance Insights are enabled"
  type        = bool
  default     = null
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
}

variable "performance_insights_kms_key_id" {
  description = "The ARN for the KMS key to encrypt Performance Insights data. When specifying performance_insights_kms_key_id, performance_insights_enabled needs to be set to true. Once KMS key is set, it can never be changed"
  type        = string
  default     = null
}

variable "performance_insights_retention_period" {
  description = "The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years)."
  type        = number
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags"
  type        = map(string)
}
