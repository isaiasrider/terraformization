output "ip" {
  value = aws_eip.ip.public_ip
}

output "webserver_name" {

  value = aws_instance.striknaidson.id
}

output "webserver_chave" {

  value = aws_instance.striknaidson.key_name
}

