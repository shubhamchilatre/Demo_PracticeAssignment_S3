terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "AKIAVLAZEFMK4RJGJ3NK"
  secret_key = "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"
} 

resource "aws_s3_bucket" "bucket" {
  bucket = "demos3practice1"

  tags = {
    Name        = "My bucket"
  }
}

resource "aws_s3_bucket_object" "file" {
  bucket = aws_s3_bucket.bucket.id
  key    = "BMW_Logo.png"
  source = "C:/Users/GSC-31010/Downloads/BMW_Logo.png"
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    id = "demos3practice-log"

    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }

}


  




