resource "aws_instance" "teste" {
  ami           = "ami-01aab85a5e4a5a0fe"
  instance_type = "t2.micro"
}