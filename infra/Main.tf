provider "aws" {
  region = "us-east-1"
}

# Crear la VPC
resource "aws_vpc" "misdatos_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

# Crear Subred Pública en la VPC
resource "aws_subnet" "public_subnet_dev" {
  vpc_id            = aws_vpc.misdatos_vpc.id
  cidr_block        = "10.0.1.64/26"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-dev"
  }
}

# Crear Subred Privada en la VPC
resource "aws_subnet" "private_subnet_dev" {
  vpc_id            = aws_vpc.misdatos_vpc.id
  cidr_block        = "10.0.1.128/26"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-subnet-dev"
  }
}

# Crear la Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.misdatos_vpc.id
}

# Crear una instancia EC2 en la Subred Pública
resource "aws_instance" "ec2_instance_dev" {
  ami           = "ami-0c55b159cbfafe1f0" # Reemplazar con la ID de AMI que prefieras
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_dev.id
  associate_public_ip_address = true

  tags = {
    Name = "ec2-instance-dev"
  }

  key_name = "my-ssh-key" # Asegúrate de tener un par de claves en AWS
}
