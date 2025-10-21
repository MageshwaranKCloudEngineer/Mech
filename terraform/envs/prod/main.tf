provider "aws" {
  alias = "local"
  region = "us-west-2"
  access_key = "dummy"
  secret_key = "dummy"
  skip_credentials_validation = true
  endpoints {
    dynamodb = "http://localhost:8000"
  }
}

module "dynamodb" {
  source = "../../modules/dynamodb"
  providers = {
    aws = "prod"
  }
}
