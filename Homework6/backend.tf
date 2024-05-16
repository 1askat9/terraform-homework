terraform {
  backend "s3" {
    bucket = "askat-bucket"
    key    = "Virginia/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "mojo-state"
  }
}