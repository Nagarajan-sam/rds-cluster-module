module "aurora" {
  source = "terraform-aws-modules/rds-aurora/aws"
  version = "9.2.0"

  name                                     = "${var.name}-${lower(var.infra_environment)}"
  engine                                   = var.engine
  engine_version                           = var.engine_version
  master_username                          = var.master_username
  engine_mode                              = var.engine_mode
  master_password                          = var.master_password
  vpc_id                                   = var.vpc_id
  db_subnet_group_name                     = var.db_subnet_group_name
  enabled_cloudwatch_logs_exports          = var.enabled_cloudwatch_logs_exports
  availability_zones                       = var.availability_zones
  allocated_storage                        = var.allocated_storage
  db_cluster_instance_class                = var.db_cluster_db_instance_class
  iops                                     = var.iops 
  deletion_protection                      = var.deletion_protection
  storage_type                             = var.storage_type
  source_region                            = var.source_region
  skip_final_snapshot                      = var.skip_final_snapshot
  apply_immediately                        = var.apply_immediately
  backup_retention_period                  = var.backup_retention_period
  storage_encrypted                        = var.storage_encrypted  
  performance_insights_enabled             = var.performance_insights_enabled
  vpc_security_group_ids                   = var.vpc_security_group_ids
  kms_key_id                               = var.kms_key_id
  performance_insights_kms_key_id          = var.performance_insights_kms_key_id
  performance_insights_retention_period    = var.performance_insights_retention_period
  tags                                     = var.tags
}

resource "aws_sns_topic" "this" {
  name = "${lower(var.name)}-${lower(var.infra_environment)}-rds-events"
  tags = var.tags
}

resource "aws_db_event_subscription" "this" {
  name      = "${lower(var.name)}-${lower(var.infra_environment)}-event-subscription"
  sns_topic = aws_sns_topic.this.arn

  source_type = "db-cluster"
  source_ids  = [module.aurora.cluster_id]

  event_categories = [
    "deletion",
    "failover",
    "failure",
    "low storage",
    "maintenance",
    "notification",
    "recovery",
  ]
  enabled  = true
  tags     = var.tags
}
