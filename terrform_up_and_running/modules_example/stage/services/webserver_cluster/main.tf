module "webserver_cluster" {
  source = "../../../modules/services/webserver_cluster"

  cluster_name = "ChikenFolks"
  db_remote_state_bucket = "testando-estado-remoto"
  db_remote_state_key = "stage/data-stores/relational_database/mysql/terraform.tfstate"
  min_size = 1
  max_size = 2


}
