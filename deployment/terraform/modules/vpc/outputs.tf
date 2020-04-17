output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet1_id" {
  value = aws_subnet.subnet1.id
}

output "subnet2_id" {
  value = aws_subnet.subnet2.id
}

output "sg1_id" {
  value = aws_security_group.sg1.id
}

output "sg2_id" {
  value = aws_security_group.sg2.id
}