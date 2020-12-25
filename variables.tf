variable "instance_type" {
  default = "t2.micro"
}

variable "instance_tags" {
  type = list(string)
  default = [
    "Web Server",
    "Application Server",
    "Device Gateway",
  ]
}
