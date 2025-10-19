provider "aws" {
  region                      = "us-west-2"
  access_key                  = "dummy"
  secret_key                  = "dummy"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  endpoints {
    dynamodb = "http://localhost:8000"
  }
}
