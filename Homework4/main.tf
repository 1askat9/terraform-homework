
provider aws {
    region = var.region 
}

  resource "aws_instance" "web" {
    ami = var.ami_id
  instance_type = var.type
   availability_zone = var.availability_zone
   key_name = var.key_name
   count = var.instance_count
   vpc_security_group_ids = [aws_security_group.allow_tls.id]
  }

  variable ami_id {
    description = "Provided ami id"
    default = ""
    type = string 
  }

  variable type {
    description = "Provided instance type "
    default = ""
    type = string 
  }

  variable region {
    description = "Provided region  "
    default = ""
    type = string 
  }

    variable key_name {
    description = "Provided key_name  "
    default = "my-laptop-key"
    type = string 
  }

    variable availability_zone {
    description = "Provided AZ  "
    default = ""
    type = string 
  }

    variable instance_count {
    description = "Provided count "
    default = 1
    type = number
  }

    variable ports {
    description = "Provided ports "
    default = [22 , 80, 443]
    type = list(number)
  }

    
