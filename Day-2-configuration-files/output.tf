output "private_ip" {
  value = aws_instance.name.private_ip
  description = "The private ip of the EC2 instance"
}

output "instance_id" {
    value =  aws_instance.name.id
    description = " This is my AMI id"
}