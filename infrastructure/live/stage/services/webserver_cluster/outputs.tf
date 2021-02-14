output "cluster_url" {
  value = module.webserver_cluster.alb_dns_name
}

output "sg_id" {
  value = module.webserver_cluster.sg_id
}