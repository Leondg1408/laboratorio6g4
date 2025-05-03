variable "vpc_cidr_block" {
  description = "CIDR block para la VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block para la subred pública"
  default     = "10.0.1.64/26"
}

variable "private_subnet_cidr" {
  description = "CIDR block para la subred privada"
  default     = "10.0.1.128/26"
}

variable "region" {
  description = "La región de AWS donde se creará la infraestructura"
  default     = "us-east-1"
}
