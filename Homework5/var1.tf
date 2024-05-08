variable region {                       #region = "us-west-2"#vpc_cidr = "192.168.0.0/16"#subnet1_cidr = "192.168.1.0/24"
  type = string 
  description = "Provided region"
}

variable vpc_cidr {
  type = list(object ({
    cidr_block = string 
    enable_dns_hostnames = bool 
    enable_dns_support = bool 
  }))
  description = "Provided vpc cidr"
}

variable subnet_cidr {
  type = list(object({
    cidr = string 
    sub_name = string 
  }))
  description = "Provided sub cidr and sub name"
}

variable pub_rt {
    type = string
    description = "Provided rt"
}

variable prv_rt {
    type = string
    description = "Provided rt"
}


variable ec2_instance {
  description = "List of ec2 instances"
  type = list(object ({
  ec2_type = string 
  ec2_name = string 
  }))
}

variable IGW {
  type = string
  description = "Provided IGW name "
}

variable ports {
    type = list(number)
    default = [22, 80]
}