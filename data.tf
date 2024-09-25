# Lookup the secret in AWS Secrets Manager
data "aws_secretsmanager_secret" "db_credentials" {
  name = "db-instance"  # Replace with your secret name
}

data "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id = data.aws_secretsmanager_secret.db_credentials.id
}

# Parse the secret value (JSON) into variables
locals {
  db_credentials = jsondecode(data.aws_secretsmanager_secret_version.db_secret_version.secret_string)
}