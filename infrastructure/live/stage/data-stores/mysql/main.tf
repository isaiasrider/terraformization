module "create_database" {
  source = "github.com/isaiasrider/terraform-modules//modules/data-stores/relational_database?ref=db_v0.0.1"

  engine = "mysql"
  instance_name = "chickenfolks"
  environment = "stage"
  number = "01"
  instance_class = "db.t2.micro"

}