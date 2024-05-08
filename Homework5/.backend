region = "us-west-2"
vpc_cidr = [{
  cidr_block = "192.168.0.0/16", 
  enable_dns_hostnames = true,
  enable_dns_support = true
}]

subnet_cidr = [
    { cidr = "192.168.1.0/24" , sub_name = "public1"},
    { cidr = "192.168.2.0/24" , sub_name = "public2"},
    { cidr = "192.168.101.0/24", sub_name = "private3"}, 
    { cidr = "192.168.102.0/24", sub_name = "private4"}
]

IGW = "homework5_igw"

pub-rt = "public-rt"
prv-rt = "private-rt"

ec2_instance = [ 

  {ec2_type = "t2.micro",ec2_name = "Amazon"},
  {ec2_type = "t2.micro",ec2_name = "ubuntu"}

]

ports = [22 , 80]