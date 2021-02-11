resource "aws_db_instance" "database_example" {
  instance_class = var.instance_class
  engine = var.engine
  allocated_storage = 10
  identifier_prefix = var.environment
  username = "teste"
  name = "${var.instance_name}_${var.environment}_${var.number}"
  password = data.aws_secretsmanager_secret_version.database_pass.secret_string
  final_snapshot_identifier = "${var.instance_name}-${var.environment}-${var.number}"
}

data "aws_secretsmanager_secret_version" "database_pass" {
  secret_id = "db_pass"
}