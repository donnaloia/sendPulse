output "api_gateway_id" {
  value = aws_api_gateway_rest_api.main.id
}

output "api_gateway_root_resource_id" {
  value = aws_api_gateway_rest_api.main.root_resource_id
}

output "api_gateway_url" {
  value = aws_api_gateway_stage.prod.invoke_url
} 