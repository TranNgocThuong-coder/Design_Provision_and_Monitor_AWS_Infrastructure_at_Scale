# TODO: Define the variable for aws_region
# variables.tf
variable "region" {
  default     = "us-east-1"
}

variable "iam_role_name" {
  default     = "lambda_execution_role"
}

variable "lambda_function_name" {
  default = "greet_lambda"
}

variable "runtime" {
  default = "python3.8"
}

variable "output_archive_lambda_function_name" {
  default = "greet_lambda.zip"
}

variable "lambda_handler" {
  default = "greet_lambda.lambda_handler"
}

