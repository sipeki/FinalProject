
################################
#### Virtual Private Cloud #####
################################


resource "aws_vpc" "vpc" {
  cidr_block            = var.DevOpsVPC
  enable_dns_hostnames = true

  tags = {
    Name = "DevOpsVPC"
  }

}

############################
#### Availability Zone #####
############################


data "aws_availability_zones" "available" {
  state = "available"
}


#####################
#### Subnet A,B #####
#####################



resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block         = var.subnet_a
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[0]
  
  tags = {
        Name = "AWSsubnet"
      }     
} 

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block         = var.subnet_b
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[1]
  
  tags = {
        Name = "AWSsubnet"
      }     
} 


##########################
#### Internet Gateway ####
##########################


resource "aws_internet_gateway" "TerraformIG" {
  vpc_id = aws_vpc.vpc.id
}


#####################
#### Route Table ####
#####################


resource "aws_route_table" "r" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.open_i
    gateway_id = aws_internet_gateway.TerraformIG.id
  }
}


#################################
#### Route Table Association ####
#################################


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.r.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet_b.id
  route_table_id = aws_route_table.r.id
}