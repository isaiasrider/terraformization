resource "aws_security_group" "sg-dummy-webserver" {
  name = "sg-dummy-webserver"

  ingress {
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }
}