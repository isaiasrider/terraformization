terraform {
 required_version = "0.12.28"
 backend s3 {
 encrypt = "true"
 bucket = "testando-estado-remoto"
 region = "us-east-1"
 dynamodb_table = "dynamo-terraform-state-lock-dynamo"

 key = "terraform_states/terraform-test.tfstate"
 }
}

