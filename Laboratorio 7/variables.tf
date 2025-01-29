variable "name" {
    type = string #variavel do tipo string
}

variable "count" {
    default = null
    type    = number
}

variable "enable" {
    type = bool
}


## Variavel Subnet
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

#description = "Subnets for the VPC"
#type =  map(object({
#    cidr_block      =   string
#    availability_zone=  string
 #   }))