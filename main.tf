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
}

output "instance_ip_addr" {
    value = aws_instance.my_instance.*.private_ip
}
