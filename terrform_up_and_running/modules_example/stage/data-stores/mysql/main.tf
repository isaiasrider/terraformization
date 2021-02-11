module "create_database" {
  source = "../../../modules/data-stores/relational_database"

  engine = "mysql"
  instance_name = "TENANT"
  environment = "stage"
  number = "02"
  instance_class = "db.t2.micro"

}