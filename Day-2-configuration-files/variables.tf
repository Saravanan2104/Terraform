variable "ami_id" {
    description = "This AMI Id to use for the EC2 Instance"
    default = "ami-0e38835daf6b8a2b9"
}

variable "instance_type" {
    default = "t3.micro"  
}

variable "name" {
    type = string
    default = "my-ec2-instance"
  
}