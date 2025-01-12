output "instance_ip" {
  value = aws_instance.business_logic.public_ip
}

output "api_gateway_resource_id" {
  value = aws_api_gateway_resource.business_logic.id
} 