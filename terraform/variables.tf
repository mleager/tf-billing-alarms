variable "email_subscriber" {
  type        = string
  description = "Email address for notifications"
}

variable "billing_alarm_thresholds" {
  type        = list(string)
  default     = ["25", "50", "100", "150"]
  description = "List of thresholds for the CloudWatch billing alarms"
}

variable "environment" {
  type        = string
  default     = "development"
  description = "Environment name (options: development, staging, production)"
}

