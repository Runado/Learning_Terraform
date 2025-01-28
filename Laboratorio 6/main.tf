terraform{
    required_providers{
    }
}
resource "aws_vpc"  "vpc" {
    cidr_block  =   "10.0.42.0/24"

    tags    =   {
        Name    =   "vpc-${var.suffix}"
    }
}

resource "aws_subnet"   "public"    {
    vpc_id          =   aws_vpc.vpc.id
    cidr_block      =   "10.0.42.128/25"
    map_public_ip_on_launch = true

    tags    =   {
        Name    = "public"
    }
}