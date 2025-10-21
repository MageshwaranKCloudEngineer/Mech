provider "aws" {
  alias = "local"
  region = "us-west-2"
  access_key = "dummy"
  secret_key = "dummy"
  skip_credentials_validation = true
  skip_requesting_account_id  = true     # <--- ADD THIS
  skip_metadata_api_check     = true     # <--- ADD THIS TOO

  endpoints {
    dynamodb = "http://localhost:8000"
  }
}

module "dynamodb" {
  source = "../../modules/dynamodb"
  env    = "dev"
  providers = {
    aws = aws.local
  }
}



