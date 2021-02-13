module "create_database" {
  source = "../../../modules/data-stores/relational_database"

  engine = "mysql"
  instance_name = "chickenfolks"
  environment = "stage"
  number = "01"
  instance_class = "db.t2.micro"

}