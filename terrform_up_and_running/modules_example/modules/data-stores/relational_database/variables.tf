variable "engine" {
  description = "set database engine"
  type = string
}

variable "environment" {
  description = "prod? stage? mgnt?"
  type = string
}

variable "instance_name" {
  type = string
}

variable "number" {
  description = "resource number"
  type = string
}

variable "instance_class" {
  description = "define instance class"
  type = string
}
