terraform {
  backend "s3" {
    bucket = "testando-estado-remoto"
    key = "stage/services/data-stores/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "dynamo-testando-estado-remoto"
    encrypt = true
  }
}