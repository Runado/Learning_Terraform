##TEMPLATE DE COMO CRIAR UMA VARIAVEL

# variable "<VARIABLE_NAME>"{
# type = <VARIABLE_TYPE>
# description = <DESCRIPTION>
# default =<EXPRESSION>
# sensitive = <BOOLEAN>
# validation =<RULES>   
#}

## Variavel para setar a AZ que sera utilizada
variable "aws_region"{
type = string
description = "regiao utilizada para realizar o deploy das workloads"
default = "us-east-1" ##regiao utilizada no bloco
}
##Variavel para definir a subnet padrao
variable "variables_sub_cidr" {
    description = "Variavel que sera utilizada para criar uma subnet"
    type = string
    default = "10.0.198.0/24"
}
##Variavel para definir ips aleatorios para a subnet
variable "variables_sub_auto_ip"{
    description = "Seta IPs aleatoriamentes para as variaveis de subnet"
    type = bool
    default = true
}
## Variavel para definir a AZ padrao
variable "variables_sub_az" {
    description = "Variavel utilizada para selecionar a AZ"
    type = string
    default = "us-east-1" 
}

variable "environment" {
    description = "Environment para deploy"
    type = string
    default = "dev"

}


