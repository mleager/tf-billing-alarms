resource "aws_sns_topic" "sns" {
  name = "billing-alarm-topic"
}

resource "aws_sns_topic_subscription" "subscription" {
  topic_arn = aws_sns_topic.sns.arn
  protocol  = "email"
  endpoint  = var.email_subscriber
}

# Create a variable number of Billing Alarms for different thresholds
resource "aws_cloudwatch_metric_alarm" "billing_alarms" {
  for_each = toset(var.billing_alarm_thresholds)

  alarm_name          = "billing-alarm-${each.key}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = 21600
  statistic           = "Maximum"
  threshold           = each.value
  alarm_description   = "This metric monitors billing thresholds"
  actions_enabled     = true
  alarm_actions       = [aws_sns_topic.sns.arn]
}

