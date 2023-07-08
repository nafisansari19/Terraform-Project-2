terraform {
  backend "s3" {
    bucket = "my-terraform-state-s3-ansari19"
    key    = "remote.tfstate"
    region = "us-east-1"
  }
}
