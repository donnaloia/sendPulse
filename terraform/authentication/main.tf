resource "aws_instance" "auth_service" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.auth_service.id]
  associate_public_ip_address = true

  tags = {
    Name = "authentication-service"
  }
}

resource "aws_security_group" "auth_service" {
  name        = "auth-service-sg"
  description = "Security group for authentication service"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_api_gateway_resource" "auth_service" {
  rest_api_id = var.api_gateway_id
  parent_id   = var.api_gateway_root_id
  path_part   = "auth"
}

resource "aws_api_gateway_integration" "auth_service" {
  rest_api_id = var.api_gateway_id
  resource_id = aws_api_gateway_resource.auth_service.id
  http_method = "ANY"
  type        = "HTTP_PROXY"
  uri         = "http://${aws_instance.auth_service.public_ip}:8081/{proxy}"

  integration_http_method = "ANY"
} 