variable "api_gateway_id" {
  description = "ID of the API Gateway"
  type        = string
}

variable "api_gateway_root_id" {
  description = "Root resource ID of the API Gateway"
  type        = string
}

variable "kafka_brokers" {
  description = "Kafka broker addresses"
  type        = string
}

variable "kafka_topic" {
  description = "Kafka topic name"
  type        = string
  default     = "email-events"
} 