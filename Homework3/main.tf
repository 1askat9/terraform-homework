provider aws {
    region = "us-west-2"
}

data "aws_availability_zones" "azs" {
    state = "available"
}

data "aws_ami" "amzn2" {
  most_recent = true

  filter {
    name   = "name"
  
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] 
}  


  resource "aws_instance" "web" {
  ami  = data.aws_ami.amzn2.id
  instance_type = "t2.micro"
  count = 3
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  key_name = aws_key_pair.bastion1-key.key_name
  user_data = file("apache.sh")
  user_data_replace_on_change = true 
  associate_public_ip_address = true


  tags = {
    Name = "web-${count.index + 1}"
  }
  }

  output ec2 {
    value = aws_instance.web[*].public_ip
  }
