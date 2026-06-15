terraform {
  backend "s3" {
    bucket = "amzon-rag-bedrock-rag"
    key    = "terraform.tfstate"
    region = "ca-central-1"
  }
}
