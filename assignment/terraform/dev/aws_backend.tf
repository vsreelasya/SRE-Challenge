terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "prod-terraform-state-storage"
    dynamodb_table = "prod-terraform-state-lock"
    key            = "prod-state-lock-storage.keypath"
    region         = "us-west-2"
  }
}
