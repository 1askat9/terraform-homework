

# main.tf

provider "aws" {
  region = "us-east-1"
}

# Create a key pair
resource "aws_key_pair" "bastion" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub") 
}

# Create S3 buckets
resource "aws_s3_bucket" "kaizenaskat" {
  bucket = "kaizenaskat"
}

resource "aws_s3_bucket" "bastion" {
  bucket = "kaizenaskat"
  tags = {
    Name = "kaizen"
    Prefix = "kaizen/home2/"
  }
}

  resource "aws_s3_bucket" "hm-2" {
  bucket = "hm-2"
}


resource "aws_s3_bucket" "hs2" {
  bucket = "hs2"
}

resource "aws_iam_user" "hms2" {
    for_each = toset([
        "jenny",
        "rose",
        "lisa",
        "jisoo"
        ])
  name = each.key
}

resource "aws_iam_group" "blackpink" {
  name = "Blackpink"
}

resource "aws_iam_group_membership" "wssw" {
  name = "tf-testing-group-membership"

  users = [
     for i in aws_iam_user.hms2 : i.name
  ]

  group = aws_iam_group.blackpink.name
}