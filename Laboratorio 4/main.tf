resource "tls_private_key" "generated"{
    algorithm = "RSA"
}

resource "local_file" "private_key_pen" {
    content = tls_private_key.generated.private_key_pen
    filename = "MyAWSKey.pen"
}

resource "aws_key_pair" "generated" {
    key_name    =   "MyOtherAWSKey"
    public_key = tls_private_key.generated.public_key_openssh

    lifecycle {
        ignore_changes = [key_name]
    }
}

## Criando máquina virtual
resource "aws_instance" "servidor_ubuntu"{
    ami = data.aws_ami.ubuntu.id
    instance_type   =   "t2.micro"
    subnet_id   =   aws_subnet.public_subnet["public_subnet_1"].id
    security_groups =   [aws_security_group.ingress-ssh.id]
    associate_public_ip_address = true
    key_name    = aws_key_pair.generated.key_name
    ## Criando a conexão com o usuario jose
    connection {
    user        = "jose"
    private_key = tls_private_key.generated.private_key_pem
    host        = self.public_ip
    }

    tags = {
        name = "Ubuntu EC2 Server"
    }
    
}

## PERMITIR ACESSO SSH
resource "aws_security_group" "ingress-ssh"{
    name    =   "Permitir-SSH"
    vpc_id  =   aws_vpc.vpc.vpc_id
    ingress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port   =   22
        to_port =   22
        protocol    =   "tcp"
    }

    ## Permite tráfego de saída 
    egress {
        from_port   =   0
        to_port     =   0
        protocol    =   "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }


## Criando um Security Group para Tráfego WEB

resource "aws_security_group" "vpc-web" {
    name    =   "vpc-web-${terraform.workspace}"
    vpc_id  =   aws_vpc.vpc.id
    description = "Web Traffic"
    ingress{
        description = "Permitir tráfego na porta 80"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks =   ["0.0.0.0/0"]
    }
    ingress{
        description = "Permitir tráfego na porta 443"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks =   ["0.0.0.0/0"]
    }
    egress {
        description = " Permitir todas os IPs e Portas de saída"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

## permitindo tráfego ICMP
resource "aws_security_group" "vpc-ping" {
    name    =   "vpc-ping"
    vpc_id  =   aws_vpc.vpc.id
    description =   "ICMP para PING"
    ingress{
        description =   "Permite tráfego ICMP"
        from_port   =   -1
        to_port     =   -1
        protocol    =   "icmp"
        cidr_blocks =   ["0.0.0.0/0"]
    }
    egress{
        description = "Permite todos os IP's e Porta Outbound"
        from_port   =   0
        to_port     =   0
        protocol    =   "-1"
        cidr_blocks =   ["0.0.0.0/0"]
    }
}
}
