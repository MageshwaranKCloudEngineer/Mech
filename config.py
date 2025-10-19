import boto3
import os

AWS_ACCESS_KEY_ID = "dummy"
AWS_SECRET_ACCESS_KEY = "dummy"
AWS_SESSION_TOKEN = "dummy"
AWS_REGION = "us-east-1"

dynamodb = boto3.resource(
    "dynamodb", region_name="us-east-1",  
    endpoint_url="http://localhost:8000", 
)
service_centers_table = dynamodb.Table("ServiceCentersTable")
warranty_table = dynamodb.Table("WarrantyTable")
appointment_table = dynamodb.Table("AppointmentTable")


# Set up SNS client
sns_client = boto3.client(
    "sns",
    aws_access_key_id=AWS_ACCESS_KEY_ID,
    aws_secret_access_key=AWS_SECRET_ACCESS_KEY,
    aws_session_token=AWS_SESSION_TOKEN,
    region_name=AWS_REGION
)

if __name__ == "__main__":

    app.run(debug=True)
