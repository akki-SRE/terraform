variable "vpc" {
  type = map(object({
    cidr_block = string
    }))
    default = {
      "vpc_main" = {
        cidr_block = "172.16.0.0/16"    
    }
  }
}
variable "subnet" {
  type = map(object({
    cidr_block = string
    availability_zone = string
    map_public_ip_on_launch = string
  }))
  default = {
    "subnet1" = {
       cidr_block = "172.16.2.0/24"
       availability_zone = "us-east-1a"
       map_public_ip_on_launch = "false"
    }
    "subnet2" = {
       cidr_block = "172.16.3.0/24"
       availability_zone = "us-east-1b"
       map_public_ip_on_launch = "false"
    }
  }
}




# variable "firewall" {
#   type = map(object({
#     name = string
#     protocol = list(string)
#     source_tags =list(string)
#     direction = string
#     target_tags = string
#   }))
#   default = {
#     "firewall1" = {
#       name = "allowsshandwebserver"
#       source_tags = ["web-ssh"]
#       protocol = ["tcp"]
#       direction = "INGRESS"
#       target_tags = "ssh"
#     }
#   }
# }