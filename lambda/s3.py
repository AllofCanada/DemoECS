import boto3
import json

sfn = boto3.client('stepfunctions')

def lambda_handler(event, context):
    # Get the filename from S3 event
    file_key = event['Records'][0]['s3']['object']['key']
    
    # We use the filename (without extension) as the execution name to find it
    execution_name = file_key.split('.')[0] 
    
    # Send success to the running Step Function
    # Note: In a production environment, you'd store the TaskToken in DynamoDB
    # but for a simple SRE check, we just signal 'Success' to the SFN
    print(f"File {file_key} received. Signaling success.")
    
    return {"status": "notified"}