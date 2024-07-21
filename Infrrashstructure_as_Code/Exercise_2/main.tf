# main.tf
provider "aws" {
  region = var.region
}

# Define IAM Role for Lambda
resource "aws_iam_role" "lambda_role" {
  name = var.iam_role_name

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

# Attach the AWSLambdaBasicExecutionRole policy to the IAM Role
resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn  = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Define the Lambda Function
resource "aws_lambda_function" "example_lambda" {
  filename         = var.output_archive_lambda_function_name
  function_name    = var.lambda_function_name
  role             = aws_iam_role.lambda_role.arn
  handler          = var.lambda_handler
  runtime          = var.runtime

  source_code_hash = filebase64sha256("greet_lambda.zip")

  environment {
    variables = {
      greeting = "Hello world!"
    }
  }
}

# Create an S3 bucket to store Lambda code
resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "lambda-bucket-${random_id.bucket_suffix.hex}"
}

# Output Lambda function ARN
output "lambda_function_arn" {
  value = aws_lambda_function.example_lambda.arn
}

# Generate a random ID for unique bucket names
resource "random_id" "bucket_suffix" {
  byte_length = 8
}
