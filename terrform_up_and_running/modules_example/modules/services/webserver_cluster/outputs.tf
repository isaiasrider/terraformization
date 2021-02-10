output "alb_dns_name" {
  value = aws_lb.lb_web.dns_name
  description = "THE DOMAIN NAME OF THE LOAD BALANCER"
}

output "teste_remote" {
  value = data.terraform_remote_state.db.outputs.db_url
}