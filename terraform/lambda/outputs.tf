output "function_arn" {
  value = aws_lambda_function.kafka_email_ingestor.arn
}

output "function_name" {
  value = aws_lambda_function.kafka_email_ingestor.function_name
}

output "api_endpoint" {
  value = "POST ${var.api_gateway_url}/ingest-email"
} 