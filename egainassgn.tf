terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  access_key = "AKIARJ6UUCFIPOB7V3JD"
  secret_key = "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"
}


# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block = "192.168.0.0/22"
  tags = { "Name" = "vpc" }
}

# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.vpc.id

#   tags = {
#     Name = "igw"
#   }
# }

# resource "aws_route_table" "igw_rt" {
#   vpc_id = aws_vpc.vpc.id
#   tags = {
#     Name = "igw_rt"
#   }
# }


# resource "aws_route" "rtb" {
#   route_table_id            = aws_route_table.igw_rt.id
#   destination_cidr_block    = "0.0.0.0/0"
#   gateway_id = aws_internet_gateway.igw.id
# }


# resource "aws_route_table_association" "elb_dmz" {
#   subnet_id      = aws_subnet.Subnet_DMZ1a.id
#   route_table_id = aws_route_table.igw_rt.id
# }


# resource "aws_subnet" "Subnet_DMZ1a" {
#   vpc_id     = aws_vpc.vpc.id
#   cidr_block = "192.168.0.0/25"
#   availability_zone = "eu-west-1a"
#   tags = {
#     Name = "Subnet_DMZ1a"
#   }
# }



# resource "aws_subnet" "Subnet_STZ1a" {
#   vpc_id     = aws_vpc.vpc.id
#   cidr_block = "192.168.1.0/25"
#   availability_zone = "eu-west-1a"
#   tags = {
#     Name = "Subnet_STZ1a"
#   }
# }

# resource "aws_subnet" "Subnet_SEC1a" {
#   vpc_id     = aws_vpc.vpc.id
#   cidr_block = "192.168.2.0/25"
#   availability_zone = "eu-west-1a"
#   tags = {
#     Name = "Subnet_SEC1a"
#   }
# }



# resource "aws_elb" "ELB" {
#   name               = "ELB"
#   subnets = [aws_subnet.Subnet_DMZ1a.id]
#   listener {
#     instance_port      = 8800
#     instance_protocol  = "TCP"
#     lb_port            = 443
#     lb_protocol        = "TCP"
#   }
#   security_groups = [aws_security_group.elb_sg.id]
#   instances = [aws_instance.Server2.id]
#   tags = {
#     Name = "ELB"
#   }
# }


# resource "aws_security_group" "sg_server2" {
#   name        = "sg_server2"
#   description = "Allow TCP inbound traffic"
#   vpc_id      = aws_vpc.vpc.id
#   ingress {
#     description      = "TCP from LB"
#     from_port        = 8800
#     to_port          = 8800
#     protocol         = "tcp"
#     cidr_blocks      = [aws_subnet.Subnet_DMZ1a.cidr_block]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }
#   tags = {
#     Name = "sg_server2"
#   }
# }


# resource "aws_security_group" "elb_sg" {
#   name        = "elb_sg"
#   description = "Allow TCP inbound traffic from internet"
#   vpc_id      = aws_vpc.vpc.id
#   ingress {
#     description      = "TCP from internet"
#     from_port        = 443
#     to_port          = 443
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }
#   tags = {
#     Name = "elb_sg"
#   }
# }


# resource "aws_security_group" "sg_server3" {
#   name        = "sg_server3"
#   description = "Allow TCP inbound traffic"
#   vpc_id      = aws_vpc.vpc.id

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "sg_server3"
#   }
# }

# resource "aws_security_group_rule" "extra_rule" {
#   security_group_id        = aws_security_group.sg_server3.id
#   from_port                = 1433
#   to_port                  = 1433
#   protocol                 = "tcp"
#   type                     = "ingress"
#   source_security_group_id = aws_security_group.sg_server2.id
# }


# resource "aws_instance" "Server2" {
#   ami           = "ami-063d4ab14480ac177"
#   instance_type = "t2.micro"
#   availability_zone = "eu-west-1a"
#   subnet_id = aws_subnet.Subnet_STZ1a.id
#   vpc_security_group_ids = [aws_security_group.sg_server2.id]
#   tags = {
#     Name = "Server2"
#   }
# }

# resource "aws_instance" "Server3" {
#   ami           = "ami-063d4ab14480ac177"
#   instance_type = "t2.micro"
#   availability_zone = "eu-west-1a"
#   subnet_id = aws_subnet.Subnet_SEC1a.id
#   vpc_security_group_ids = [aws_security_group.sg_server3.id]
#   tags = {
#     Name = "Server3"
#   }
# }

# resource "aws_ebs_volume" "server2_ebs" {
#   availability_zone = "eu-west-1a"
#   size              = 8
# }

# resource "aws_ebs_volume" "server3_ebs" {
#   availability_zone = "eu-west-1a"
#   size              = 8
# }

# resource "aws_volume_attachment" "ebs_att_server2" {
#   device_name = "/dev/sdh"
#   volume_id   = aws_ebs_volume.server2_ebs.id
#   instance_id = aws_instance.Server2.id
# }

# resource "aws_volume_attachment" "ebs_att_server3" {
#   device_name = "/dev/sdh"
#   volume_id   = aws_ebs_volume.server3_ebs.id
#   instance_id = aws_instance.Server3.id
# }
