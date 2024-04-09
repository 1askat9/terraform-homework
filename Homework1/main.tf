#/bin/bash

# Define AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create users
resource "aws_iam_user" "blackpink_users" {
  count = 4
  name  = "blackpink-user-${count.index + 1}"
}

resource "aws_iam_user" "twice_users" {
  count = 4
  name  = "twice-user-${count.index + 1}"
}

# Create groups
resource "aws_iam_group" "blackpink_group" {
  name = "blackpink"
}

resource "aws_iam_group" "twice_group" {
  name = "twice"
}

# Add users to groups
resource "aws_iam_group_membership" "blackpink_group_membership" {
  name = "blackpink-membership"
  users = [for user in aws_iam_user.blackpink_create_user : user.name]
  group = aws_iam_group.required_groups["blackpink"].name
}

resource "aws_iam_group_membership" "twice_group_membership" {
  name = "twice-membership"
  users = [for user in aws_iam_user.twice_create_user : user.name]
  group = aws_iam_group.required_groups["twice"].name
}

resource "aws_iam_user" "miyeon" {
  
  name  = "miyeon"
}

resource "aws_iam_user" "mina" {
  
  name  = "mina"
}

 