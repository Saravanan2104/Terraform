output "Instance_public_ip" {
   value = aws_instance.name.public_ip  
}

output "private_ip" {
    value = aws_instance.name.private_ip
}

output "vpc_id" {
    value = aws_instance.name.vpc_security_group_ids
}

output "subnet_id" {
    value = aws_instance.name.subnet_id  
}