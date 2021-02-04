terraform {
  backend "s3" {
    bucket = "testando-estado-remoto"
    key = "workspaces-example/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "dynamo-testando-estado-remoto"
    encrypt = true
  }
}