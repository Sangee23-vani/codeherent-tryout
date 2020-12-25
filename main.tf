output "instance_ip_addr" {
  value = aws_instance.my_instance.*.private_ip
}

resource "aws_route_table" "route_table1" {
  vpc_id = 
}

resource "aws_main_route_table_association" "main_route_table_association" {
  vpc_id = 
  route_table_id = 
}
