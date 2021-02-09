resource "aws_db_instance" "database_example" {
  instance_class = "db.t2.micro"
  engine = "mysql"
  allocated_storage = 10
  identifier_prefix = "terraform-up-and-running"
  username = "teste"
  name = "example_database"
  password = data.aws_secretsmanager_secret_version.database_pass.secret_string
  final_snapshot_identifier = "teste"
}

data "aws_secretsmanager_secret_version" "database_pass" {
  secret_id = "db_pass"
}