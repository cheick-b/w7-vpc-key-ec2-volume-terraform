terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0" # or the latest version you're comfortable with
    }
  }

}

provider "aws" {
  region = "us-east-1"
}
