output "alb_dns_name" {
  value = aws_lb.lb_web.dns_name
  description = "THE DOMAIN NAME OF THE LOAD BALANCER"
}