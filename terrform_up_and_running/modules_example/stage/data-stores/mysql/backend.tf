terraform {
  backend "s3" {
    bucket = "testando-estado-remoto"
    key = "prod/data-stores/relational_database/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "dynamo-testando-estado-remoto"
    encrypt = true
  }
}