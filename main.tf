terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket = "sctp-ce10-tfstate"
    key    = "andre-sctp-ce10.tfstate" #Change this
    region = "ap-southeast-1"
  }
}

resource "aws_s3_bucket" "s3_tf" {
  #checkov:skip=6:"Ensure that S3 bucket has a Public Access block"
  #checkov:skip=145:"Ensure that S3 buckets are encrypted with KMS by default"
  #checkov:skip=62:"Ensure S3 buckets should have event notifications enabled"
  #checkov:skip=18:"Ensure the S3 bucket has access logging enabled"
  #checkov:skip=144:"Ensure that S3 bucket has cross-region replication enabled"
  #checkov:skip=21:"Ensure all data stored in the S3 bucket have versioning enabled"
  #checkov:skip=61:"Ensure that an S3 bucket has a lifecycle configuration"

  bucket_prefix = "sctp-ce10-andre-tfci" # Set your bucket name here
}