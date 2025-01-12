# Add any variables needed for API Gateway configuration
variable "stage_name" {
  description = "Stage name for the API Gateway"
  type        = string
  default     = "prod"
} 