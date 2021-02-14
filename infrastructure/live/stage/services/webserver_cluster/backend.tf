terraform {
  backend "s3" {
    bucket = "testando-estado-remoto"
    key = "teste_module_web_withoutstate/services/webserver-cluster/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "dynamo-testando-estado-remoto"
    encrypt = true
  }
}