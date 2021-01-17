resource "aws_instance" "example" {

  ami = "ami-00ddb0e5626798373"
  instance_type = "t2.micro"
  user_data = <<-EOF
  #/bin/bash
  echo "Hello World" > index.html
  nohup busybox httpd -f -p 8080 &
  EOF
tags = {
  Name = "Dummy Web Server"
}
}
