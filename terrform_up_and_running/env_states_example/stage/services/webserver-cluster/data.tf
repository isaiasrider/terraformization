data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    key = "stage/services/data-stores/mysql/terraform.tfstate"
    bucket = "testando-estado-remoto"
    region = "us-east-2"

  }

}