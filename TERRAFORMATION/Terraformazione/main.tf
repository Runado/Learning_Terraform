## Utilizando modulos no terraform, eu posso indicar o caminho local onde o codigo de origem remoto será baixado.
## TEMPLATE

#module "<MODULE_NAME>"{
#Module Block Body
#    source = <MODULE_SOURCE>
#   <INPUT_NAME> = <DESCRIPTION> 
#   <INPUT_NAME> = <DESCRIPTION> 
#}

module "website_s3_bucket" {
source = "./modules/aws-s3-static-website-bucket"
bucket_name = var.s3_bucket_name
aws_region = "us-east-1"

tags = {
Terraform = "true"
Environment = "certification"
}
}
module "subnet_addrs" {
source = "hashicorp/subnets/cidr"
version = "1.0.0"
base_cidr_block = "10.0.0.0/22"
networks = [
{
name = "module_network_a"
new_bits = 2
},
{
name = "module_network_b"
new_bits = 2
},
]
}
