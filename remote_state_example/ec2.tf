resource "aws_instance" "striknaidson" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  key_name      = "terraform"
  vpc_security_group_ids = [aws_se]

  tags = {
    Name = "webserver_test"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("../terraform")
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
  instance = aws_instance.striknaidson.id
}
