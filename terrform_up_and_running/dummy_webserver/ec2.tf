resource "aws_instance" "example" {

  ami = "ami-0a0ad6b70e61be944"
  instance_type = "t2.micro"
  key_name = "terraform"
  vpc_security_group_ids = [aws_security_group.teste.id]
  user_data = <<-EOF
  --//
  Content-Type: text/x-shellscript; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Content-Disposition: attachment; filename="userdata.txt"

  #!/bin/bash
  /bin/echo "Hello World" >> /tmp/testfile.txt
  --//
EOF
tags = {
  Name = "Dummy Web Server"
}
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("/home/isaias/Documents/terraform.pem")
    host        = self.public_ip
  }
  provisioner "remote-exec" {

    inline = [
      "sudo amazon-linux-extras enable nginx1.12",
      "sudo yum -y install nginx",
      "sudo systemctl start nginx"
    ]
  }
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.example.id
}

