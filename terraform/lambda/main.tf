resource "aws_lambda_function" "kafka_email_ingestor" {
  filename         = "kafka_email_ingestor.zip"
  function_name    = "kafka-email-ingestor"
  role            = aws_iam_role.lambda_role.arn
  handler         = "index.handler"
  runtime         = "nodejs18.x"

  environment {
    variables = {
      KAFKA_BROKERS = var.kafka_brokers
      KAFKA_TOPIC   = var.kafka_topic
    }
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "kafka-email-ingestor-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# API Gateway integration for Lambda
resource "aws_api_gateway_resource" "lambda" {
  rest_api_id = var.api_gateway_id
  parent_id   = var.api_gateway_root_id
  path_part   = "ingest-email"
}

resource "aws_api_gateway_method" "lambda" {
  rest_api_id   = var.api_gateway_id
  resource_id   = aws_api_gateway_resource.lambda.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = var.api_gateway_id
  resource_id = aws_api_gateway_resource.lambda.id
  http_method = aws_api_gateway_method.lambda.http_method
  
  integration_http_method = "POST"
  type                   = "AWS_PROXY"
  uri                    = aws_lambda_function.kafka_email_ingestor.invoke_arn
} 