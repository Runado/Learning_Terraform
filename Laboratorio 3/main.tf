provider "aws" {
  region = "us-east-1"
}




## O CONCEITO DE DATA SOURCE E UMA FEATURE MUITO FORTE DO TERRAFORM.
# pode ser utilizado para coletar dados de outras workspaces do terraform alem de retornar dados das APIs das principais nuvens
# query data based
# O DATA BLOCK PODE SER UTILIZADO TAMBEM PARA FORMAR UM LACO DE REPETICAO COMO FOR and WHILE
## o comando abaixo e formado pelo tipo "AWS_REGION" e a STRING que se refe ao nome "current" em seguida das chaves.
#data "<DATA TYPE>" "<NOME ATRIBUIDO LOCALMENTE>" {
# CORPO DO DATA BLOCK
#PODERA HAVER ATRIBUTOS E FILTROS
#}
data "aws_availability_zones" "available" {}
data "aws_region" "current"{}




## Essas variaveis serao uteis para identificar o recurso criado pelo nome que sera DEV e a AZ em que sera provisionada.

## Template de uma variavel de ambiente
#locals{
# nome_da_variavel_local = <valor ou expressao/nome>
#}
locals{
  time = timestamp()
  team = "api_mgmt_dev"
  application = "corp_api"
  server_name = "ec2-$(var.environment)-api-$(var.variables_sub_az)"  
}



resource "aws_subnet" "variables-subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.variables_sub_cidr
  availability_zone = var.variables_sub_az
  map_public_ip_on_launch = var.variables_sub_auto_ip
  tags = {
    name = "sub-variables-$(var.variables_sub_az)"
    Terraform = "true"
  }
}








resource "aws_vpc" "vpc" {
  cidr_block = var.variables_sub_cidr
  tags = {

    Name = "CIDR: $(var.variables_sub_cidr)"
    environment = "ambiente de teste"
    Terraform = "true"
## nesta linha estou usando o conceito de data source, o data source e util para buscar informacoes direto da API da AWS ou de outra nuvem
## pode-se formar usando a seguinte estrutura = data.(tipo do data).(nome do data).(a informacao que voce deseja retornar da API)    
## Para buscar outros atributos, consultar o manual do terraform alem de name, existe endpoint, description...
    Region = data.aws_region.current.name 
  }

}

## Exemplo da criação de um recurso, uma Routing Table em terraform.
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
# resource "nome do recurso AWS a ser criado" "nome do recurso"
# Um recurso deve ter um nome unico além do tipo do serviço que está sendo criado
# aws_route_table é o recurso e public_route_table é o nome que identifica o recurso
# para identifica-lo ficaria assim aws_route_table essa interpolação é bastante utilizada no terraform
route{
  cidr_block     = "0.0.0.0/0"
  gateway_id     = aws_internet_gateway.internet_gateway.id
  #nat_gateway_id = aws_nat_gateway.nat_gateway.id 
  }
  tags = {
      Name      = "demo_public_rtb"
      Terraform = "true"
    }
 }


## Criando um Bucket  e definindo uma ACL assim como identificado-o com uma TAG
resource "aws_s3_bucket" "S3-bucket" {
  bucket = "meu-bucket-de-teste-joseph-lu"
  tags = {
    name = "Vazo S3 do jose lucas"
    purpose = "if you want so yes"
  }
}
resource "aws_s3_bucket_ownership_controls" "acl_do_bucket_do_jose" {
  bucket = aws_s3_bucket.S3-bucket.id
  rule{
    object_ownership = "BucketOwnerPreferred"
  }

}

## Esse codigo em especifico basicamente percorre uma lista criando a subnet privada em todas as AZ`s, basicamente ele utiliza dos recursos do data source para passar uma lista de AZ`s
##  
#resource "aws_subnet" "private_subnets" {
#  for_each = var.private_subnets
#  vpc_id = aws_vpc.vpc.id
#  cidr_block = cidrsubnet(var.vpc_cidr, 8, each.value)
#  availability_zone = tolist(data.aws_availability_zones.available.names)[each.value]
#  tags = {
#    Name = each.key
#    Terraform = "True"
#  }
#}


## Criando um data source com atributos que irao puxar sempre a versao mais atualizada de uma AMI baseada nos filtros passados.
## No codigo abaixo, o data source ira conter sempre a versao mais atualizada do ubuntu xenial.
data "aws_ami" "ubuntu" {
    most_recent = true
    filter{
      name = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "my-new-security-group" {
name = "web_server_inbound_traffic"
description = "permitir trafego na porta 443 vinda da internet"
vpc_id = aws_vpc.vpc.id

ingress {
    description = "permitir trafego na porta 443 vinda da internet"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
  tags = {
    Name = "Web_server_inbound"

  }

}
##Gerar numeros aleatorios
#resource "random_id" "randomness" {
#  byte_length = 16
#}

## Criando o WebServer que ira utilizar das variaveis locais, data_sources e os conceitos de argumentos e expressoes
resource "aws_instance" "web_server" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnets["public_subnet_1"].id
 ## Criando as tags de identificacao do recurso com base nas variaveis locais definidas previamente. 
  tags = {
    name = local.server_name
    Owner = local.team
    App = local.application
  }

}