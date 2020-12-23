variable "instance_count" {
  default = 1
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-09558250a3419e7d0"
}

variable "instance_tags" {
  type = list(string)
  default = [
    "Web Server",
    "Application Server",
    "Device Gateway",
  ]
}
