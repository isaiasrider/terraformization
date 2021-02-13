module "webserver_cluster" {
  source = "../../../modules/services/webserver_cluster"

  cluster_name = "ChikenFolks"
  db_remote_state_bucket = "testando-estado-remoto"
  db_remote_state_key = "teste_module_withoutbackend/data-stores/relational_database/terraform.tfstate"
  min_size = 1
  max_size = 2


}
