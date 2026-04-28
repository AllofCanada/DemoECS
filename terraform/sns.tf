resource "aws_sns_topic" "user_updates" {
  name = "user-updates-topic"
}



resource "aws_sns_topic_subscription" "email_subscription" {
    for_each = toset([
        "mohammedabdulfarhan17@gmail.com",
        "mafarhan1234@gmail.com"
    ])
  topic_arn            = aws_sns_topic.user_updates.arn
  protocol             = "email"
  endpoint             = each.value
  
}