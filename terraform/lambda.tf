data "archive_file" "s3_lambda_code"{
  type        = "zip"
  source_file = "${path.module}/lambda/s3.py"
  output_path = "${path.module}/lambda/function.zip"
}



resource "aws_lambda_function" "example" {
  filename      = data.archive_file.s3_lambda_code.output_path
  function_name = "example_lambda_function"
  role          = "arn:aws:iam::541804384520:role/lambda"
  handler       = "s3.lambda_handler"
  code_sha256   = data.archive_file.s3_lambda_code.output_base64sha256

  runtime = "python3.12"

  environment {
    variables = {
      ENVIRONMENT = "production"
      LOG_LEVEL   = "info"
    }
  }

  tags = {
    Environment = "production"
    Application = "example"
  }
}