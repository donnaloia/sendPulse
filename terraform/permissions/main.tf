resource "aws_instance" "permissions_service" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.permissions_service.id]
  associate_public_ip_address = true

  tags = {
    Name = "permissions-service"
  }
}

resource "aws_security_group" "permissions_service" {
  name        = "permissions-service-sg"
  description = "Security group for permissions service"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 8000
    to_port     = 8000
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

resource "aws_api_gateway_resource" "permissions_service" {
  rest_api_id = var.api_gateway_id
  parent_id   = var.api_gateway_root_id
  path_part   = "permissions"
}

resource "aws_api_gateway_integration" "permissions_service" {
  rest_api_id = var.api_gateway_id
  resource_id = aws_api_gateway_resource.permissions_service.id
  http_method = "ANY"
  type        = "HTTP_PROXY"
  uri         = "http://${aws_instance.permissions_service.public_ip}:8000/{proxy}"

  integration_http_method = "ANY"
} 