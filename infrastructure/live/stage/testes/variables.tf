variable "lista_nomes" {
  type = list(string)
  default = ["teste","isaias","reh","maisum"]
}

variable "mapeamento" {
  type = map(string)
  default = {
    isaias = "analista DevOps"
    teste = "2ndline Analyst"
    sousa = "SecOps Engineer"
    reh = "teste"

  }
}
 variable "nome" {
   type = string
   default = "isaias"
 }
output "for_directive" {
  value = <<EOF
  %{~ for names in var.lista_nomes }
  ${names}
  %{~endfor}
  EOF
}

output "if_else_directive" {

  value = <<EOF

  %{for names in var.lista_nomes}
    "Hello, %{if var.lista_nomes != ""} ${names} %{else} (UNNAMED) %{endif}"
  %{endfor}

EOF
  //value = "e ae cumpady, %{ if var.nome != "" } ${var.nome} %{else} ((UNAMED)) %{endif}"
}

//output "mostra_nomes" {
//  value = [for names in var.lista_nomes: "seu nome es: ${names}"]
//}
//
//output "mapeamento" {
//  value = [for nome,profissao in var.mapeamento: "${nome} = ${profissao}"]
//}
//
//output "mapeamento_2" {
//  value = {for name,role in var.mapeamento: upper(name) => upper(role) if length(name) <= 3 }
//}
