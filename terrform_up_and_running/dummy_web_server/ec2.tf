resource "aws_instance" "example" {

  ami = ""
  instance_type = ""
  user_data = <<-EOF
  #/bin/bash
  echo "Hello World" > index.html
  nohup busybox httpd -f -p 8080 &
  EOF
tags = {
  Name = "Dummy Web Server"
}
}
