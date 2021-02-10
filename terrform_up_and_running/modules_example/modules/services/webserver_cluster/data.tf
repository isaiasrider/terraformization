data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    key = var.db_remote_state_key
    bucket = var.db_remote_state_bucket
    region = "us-east-2"

  }

}