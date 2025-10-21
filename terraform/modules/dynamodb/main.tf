resource "aws_dynamodb_table" "service_centers" {
  name         = "${var.env}_ServiceCentersTable"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "warranty" {
  name         = "${var.env}_WarrantyTable"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "appointment" {
  name         = "${var.env}_AppointmentTable"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

output "tables" {
  value = [
    aws_dynamodb_table.service_centers.name,
    aws_dynamodb_table.warranty.name,
    aws_dynamodb_table.appointment.name
  ]
}

