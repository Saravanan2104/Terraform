terraform {
    required_providers {
        aws = {
            source = "hasicorp/aws"
            version = "6.46.0"
        }
    }
}

provider "aws" {
    profile = "venugopal"  
    region = "ap-south-1"
}