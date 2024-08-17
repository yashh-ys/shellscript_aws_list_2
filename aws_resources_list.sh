#!/bin/bash

############################################
#Author: Yashh
#version: v0.2.4

# Script to automate the process of AWS resources list

# Following are the services that are supported by this script:
# 1. EC2
# 2. CloudFront
# 3. S3
# 4. RDS
# 5. Route53
# 6. IAM
# 7. VPC
# 8. CloudWatch
# 9. CloudFormation
# 10. DynamoDB
# 11. SNS
# 12. SQS
# 13. Lambda
# 14. ELB
# 15. EBS

# Usage : ./aws_resource_list.sh <region> <service_name>
# Example: ./aws_resource_list.sh ap-south-1 EC2
############################################

# Check if the required nummber of arguments are passed
if [ $# -ne 2 ]; then
	echo "Usage: $0 <aws_region> <aw_service>"
	echo "Example: ./aws_resource_list.sh ap-south-1 ec2"
	exit 1
fi

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install the AWS CLI and try again."
    exit 1
fi

# Check if AWS CLI is configured
if [ ! -d ~/.aws ]; then
	echo "AWS CLI is not configured. Please configure AWS CLI and try agian."
	exit 1
fi

# Assigning the arguments to variables and converting the service to lowercase
aws_region=$1
aws_service=$2

# listing of resources based on the service
case $2 in
    ec2)
        echo "Listing EC2 Instances in $1"
        aws ec2 describe-instances --region $1
        ;;
    cloudfront)
        echo "Listing CloudFront Distributions in $1"
        aws cloudfront list-distributions --region $1
        ;;
    s3)
        echo "Listing EC2 Instances in $1"
        aws s3api list-buckets --region $1
        ;;
    rds)
        echo "Listing EC2 Instances in $1"
        aws rds describe-db-instances --region $1
        ;;
    route53)
        echo "Listing EC2 Instances in $1"
        aws route53 list-hosted-zones --region $1
        ;;
    iam)
        echo "Listing EC2 Instances in $1"
        aws iam list-users --region $1
        ;;
    vpc)
        echo "Listing EC2 Instances in $1"
        aws ec2 describe-vpcs --region $1
        ;;
    cloudwatch)
        echo "Listing EC2 Instances in $1"
        aws cloudwatch describe-alarms --region $1
        ;;
    cloudformation)
        echo "Listing EC2 Instances in $1"
        aws cloudformation describe-stacks --region $1
        ;;
    dynamodb)
        echo "Listing EC2 Instances in $1"
        aws dynamodb list-tables --region $1
        ;;
    sns)
        echo "Listing EC2 Instances in $1"
        aws sns list-topics --region $1
        ;;
    sqs)
        echo "Listing EC2 Instances in $1"
        aws sqs list-queues --region $1
        ;;
    lambda)
        echo "Listing EC2 Instances in $1"
        aws lambda list-functions --region $1
        ;;
    elb)
        echo "Listing EC2 Instances in $1"
        aws elb describe-load-balancers  --region $1
        ;;
    ebs)
        echo "Listing EC2 Instances in $1"
        aws ec2 describe-volumes --region $1
        ;;
    *)
        echo "Invalid service. Please enter a valid service."
        exit 1
        ;;
esac
