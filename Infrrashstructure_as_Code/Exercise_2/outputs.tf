# TODO: Define the output variable for the lambda function.
# outputs.tf
output "lambda_function_name" {
  value = aws_lambda_function.example_lambda.function_name
}

