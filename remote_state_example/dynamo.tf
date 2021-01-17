resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "dynamo-testando-estado-remoto"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }
}

resource "aws_s3_bucket" "terraform-state-storage-s3" {
  bucket = "testando-estado-remoto"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "S3 Remote Terraform State Store"
  }
}