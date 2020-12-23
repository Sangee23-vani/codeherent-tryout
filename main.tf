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

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main
  route {
    cidr_block = 0.0.0.0
    gateway_id = aws_internet_gateway.gw
  }
}

resource "aws_route_table" "route_table1" {
  vpc_id = 
}

resource "aws_route_table_association" "route_table_association" {
  route_table_id = 
}

resource "aws_main_route_table_association" "main_route_table_association" {
  vpc_id = 
  route_table_id = 
}

resource "aws_subnet" "subnet1" {
  cidr_block = 
  vpc_id = aws_vpc.main
}
