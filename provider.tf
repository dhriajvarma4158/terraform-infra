provider "aws" {
  profile = "dheerajvarma"
  region  = var.region
}

terraform {
  backend "s3" {
    bucket         = "dheerajvarma-terraform-state-bucket"
    key            = "training/terraform.tfstate"
    region         = "ca-central-1"
    encrypt        = true
    dynamodb_table = "dheerajvarma-terraform-lock-table"
  }
}
