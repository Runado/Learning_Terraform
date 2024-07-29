output "subnet_addrs" {
value = module.subnet_addrs.network_cidr_blocks
}

output "web_server_ip" {
    description = "Endereço IP Público de um Web Server em um EC2"
    value       = aws_instance.web_server.public_ip
    sensitive   = true
}


## output "<NAME>" {
## Block body
##      value= <EXPRESSION> ou argumento
## }

output "hello-world" { ## O NOME DESTE OUTPUT SERÁ HELLO-WORLD
description = "Printe um Hello World" # Durante essa description é possível detalhar o output
value = "Hello World" ## esse será o texto de output, o output sempre será definido na variável value
}

output "vpc_id" { ## output chamado vpc_id
description = "Print o ID da VPC primária" ## descrição
value = aws_vpc.vpc.id ##  o que será exibido como output, irá puxar da resource aws_vpc e o valor atribuido ao vpc.id 
}



output "public_url" {
  description = "Endereço Público de um Web Server"   ## Neste exemplo podemos verificar que o campo value aceita variáveis, melhorando assim o output
  value = "https://${aws_instance.web_server.public_ip}:8080/index.html"
}

output "vpc_information" {
  description = "Informações sobre a VPC para o seu ambiente"
  value = "Seu ${aws_vpc.vpc.tags.Environment} VPC tem o ID de ${aws_vpc.vpc.id}"
}




## O Comando Terraform Output, printa esse arquivo de output na tela.
## É possível utilizar o comando Terraform output -json, para obter o output em um diferente formato
  
