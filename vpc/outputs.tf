output "vpc_id" {
  description = "ID of vpc"
  value       = aws_vpc.vpc.id
}

output "public_subnet1_id" {
  description = "ID of public subnet 1"
  value       = aws_subnet.public-subnet-1.id
}

output "public_subnet2_id" {
  description = "ID of public subnet 2"
  value       = aws_subnet.public-subnet-2.id
}

output "public_subnet3_id" {
  description = "ID of public subnet 3"
  value       = aws_subnet.public-subnet-3.id
}

output "private_subnet1_id" {
  description = "ID of private subnet 1"
  value       = aws_subnet.private-subnet-1.id
}

output "private_subnet2_id" {
  description = "ID of private subnet 2"
  value       = aws_subnet.private-subnet-2.id
}


output "private_subnet3_id" {
  description = "ID of private subnet 3"
  value       = aws_subnet.private-subnet-3.id
}

output "internet_gateway_id" {
  description = "ID of internet gateway"
  value       = aws_internet_gateway.internet-gateway.id
}

output "public_route_table_id" {
  description = "ID of public route table"
  value       = aws_route_table.public-route-table.id
}

output "Nat_gateway_id" {
  description = "ID of nat gateway"
  value       = aws_nat_gateway.Nat-gateway.id
}

output "private_route_table_id" {
  description = "ID of private route table"
  value       = aws_route_table.private-route-table.id
}

