variable "ami_id" {
    type = string
    description = "used for the AMI ID"
    default = ""
}

variable "instance_type" {
    type = string
    description = "type of the instance"
    default = ""  
}

variable "name" {
    type = string
    description = "name of the instance"
    default = ""  
}