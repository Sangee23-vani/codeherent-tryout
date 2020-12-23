resource "aws_key_pair" "my_key" {
  key_name = "sangee"
  public_key = file("sangee.pub")
}

resource "aws_instance" "my_instance" {
  count = var.instance_count
  ami = var.ami
  instance_type = var.instance_type
  tags = {
    Name = element(var.instance_tags, count.index)
  }
  subnet_id = aws_subnet.subnet.id
}

output "instance_ip_addr" {
  value = aws_instance.my_instance.*.private_ip
}

resource "aws_subnet" "subnet" {
  cidr_block = "10.0.0.0/17"
  vpc_id = aws_vpc.main.id
}

module "ec2-instance" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "2.16.0"
    # A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet.
  ipv6_address_count = 1
    # Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption.
  user_data_base64 = ""
    # The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead.
  user_data = ""
    # Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface
  ipv6_addresses = [  ]
    # Private IP address to associate with the instance in a VPC
  private_ip = ""
    # Name to be used on all resources as prefix
  name = ""
    # If true, the EC2 instance will have associated public IP address
  associate_public_ip_address = false
    # A list of security group IDs to associate with
  vpc_security_group_ids = [  ]
    # The type of instance to start
  instance_type = ""
    # ID of AMI to use for the instance
  ami = ""
  subnet_id = aws_subnet.subnet
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main
  route {
    cidr_block = 0.0.0.0/0
    gateway_id = aws_internet_gateway.gw
  }
}

resource "aws_route_table" "route_table1" {
  vpc_id = 
}

resource "aws_route_table_association" "route_table_association" {
  route_table_id = 
}

resource "aws_route_table_association" "route_table_association1" {
  route_table_id = aws_route_table.route_table
  subnet_id = aws_subnet.subnet
}

resource "aws_main_route_table_association" "main_route_table_association" {
  vpc_id = 
  route_table_id = 
}
