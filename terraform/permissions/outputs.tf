output "instance_ip" {
  value = aws_instance.permissions_service.public_ip
}

output "api_gateway_resource_id" {
  value = aws_api_gateway_resource.permissions_service.id
} 