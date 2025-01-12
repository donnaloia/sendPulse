resource "aws_instance" "business_logic" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.business_logic.id]
  associate_public_ip_address = true

  tags = {
    Name = "business-logic-service"
  }
}

resource "aws_security_group" "business_logic" {
  name        = "business-logic-sg"
  description = "Security group for business logic service"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 8080
    to_port     = 8080
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

resource "aws_api_gateway_resource" "business_logic" {
  rest_api_id = var.api_gateway_id
  parent_id   = var.api_gateway_root_id
  path_part   = "business-logic"
}

resource "aws_api_gateway_integration" "business_logic" {
  rest_api_id = var.api_gateway_id
  resource_id = aws_api_gateway_resource.business_logic.id
  http_method = "ANY"
  type        = "HTTP_PROXY"
  uri         = "http://${aws_instance.business_logic.public_ip}:8080/{proxy}"

  integration_http_method = "ANY"
} 