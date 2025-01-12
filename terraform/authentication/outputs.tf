output "instance_ip" {
  value = aws_instance.auth_service.public_ip
}

output "api_gateway_resource_id" {
  value = aws_api_gateway_resource.auth_service.id
} 