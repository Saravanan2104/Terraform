resource "aws_instance" "name" {
    instance_type = var.instance_typegal
    ami = var.ami_idgal
    tags = {
      Name = var.name_of_the_instancegal
    }
  
}