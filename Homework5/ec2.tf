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

  owners = ["211125299363"] 
}  


  resource "aws_instance" "Amazon" {
  ami  = data.aws_ami.amzn2.id
  instance_type = var.ec2_instance[0].ec2_type 
  subnet_id = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = aws_key_pair.bastion1-key.key_name
  user_data = file("apache.sh")

  tags = {
    name = var.ec2_instance[0].ec2_name
  }
 
  }


  data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["211125299363"] 
}

resource "aws_instance" "ubuntu" {
ami          = data.aws_ami.ubuntu.id
instance_type = var.ec2_instance[1].ec2_type
   subnet_id = aws_subnet.public2.id
vpc_security_group_ids = [aws_security_group.allow_tls.id]
key_name = aws_key_pair.bastion1-key.key_name
user_data = file("apache.sh")

tags = {
  name = var.ec2_instance[1].ec2_name
}
}