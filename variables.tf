### Variables 
### Region 
variable "target_region" {
  type        = string
  description = "Region for our Infra"

}

### Keypair
variable "key_pair" {
  type        = string
  description = "Key"

}

### Instance Type
variable "instance_type" {
  type        = string
  description = "Ec2 Instance Type"

}

### VPC CIDR
variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR Range"

}

### Subnet CIDR
variable "subnet1_cidr" {
  type        = string
  description = "CIDR of subnet-1"

}

### Subnet CIDR
variable "subnet2_cidr" {
  type        = string
  description = "CIDR of subnet-2"

}

### Subnet AZ
variable "subnet1_az" {
  type        = string
  description = "Availability Zone of Subnet"

}

### Subnet AZ
variable "subnet2_az" {
  type        = string
  description = "Availability Zone of Subnet"

}