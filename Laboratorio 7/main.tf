## O Terraform possui diferentes data types

## Lista
variable "api_names"{
    default = ["users", "products", "orders"] ## Elementos dentro de uma lista
    description =   "lista de nomes de APIs a serem criadas"
    type = list(string)
}


## Set 
# Nesta lista ele so ira buscar por dados nao duplicados ou seja dados com valores unicos.
resource "aws_apigatewayv2_api" "apis" {
    for_each = toset(var.api_names)
    name    =   each.key
    protocol_type   =   "HTTP"
}

## Tuples
variable "http_nacl" {
    default =   ["server-a", 80, true] ## Esta lista tem diferentes tipos de dados, sendo uma string, int e um bool.
    type    =   tuple([string, number, bool])
}

## abaixo um exemplo da utilizacao de um laco de repeticao

variable "subnets" {
    default =   {
        public-1a   =   {
            cidr_block      =   "10.42.100.0/24"
            availability_zone   =   "us-east-1a"
        }
        public-1b   =   {
            cidr_block      =   "10.42.101.0/24"
            availability_zone   =   "us-east-1b"
        }
        private-1a  =   {
            cidr_block      =   "10.42.200.0/24"
            availability_zone   =  "us-east-1a"
        }
        private-1b  =   {
            cidr_block      =   "10.42.202.0/24"
            availability_zone   =   "us-east-1b"
        }
    }
}

description = "Subnets for the VPC"
type    =   map(object({
    cidr_block      =   string
    availability_zone=  string
    }))
}