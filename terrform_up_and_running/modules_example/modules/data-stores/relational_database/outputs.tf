output "db_pass" {
  value = data.aws_secretsmanager_secret_version.database_pass.secret_string
}

output "db_url" {
  value = aws_db_instance.database_example.address
}

output "db_port" {
  value = aws_db_instance.database_example.port
}