module "webserver_cluster" {
  source = "../../../modules/services/webserver_cluster"

  cluster_name = "striknaidson"
  db_remote_state_bucket = "testando-estado-remoto"
  db_remote_state_key = "stage/services/data-stores/mysql/terraform.tfstate"
}