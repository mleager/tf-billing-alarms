# AWS Account - Billing Alarms


## Purpose

Set up multiple AWS Account billing alarms

- These should be terraformed from a tf-aws-account repository

- $25, $50, $100, $150 or similar to help ensure you catch the alarm


Send an email to the defined subscriber when threshold is exceeded


## Required Services

SNS:

- Topic
- Subscription


Cloudwatch:

- Alarms
- Billing Alarms must be in `us-east-1`


## Docs

**Creating Billing Alarms**

https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html


**Creating an SNS Topic**

https://docs.aws.amazon.com/sns/latest/dg/sns-create-topic.html


## Workflow

**Note:**

It is recommended to set up a required "strict" status check in your repository for "Terraform Cloud".  
See the documentation on "strict" required status checks for more information: 

    - https://help.github.com/en/github/administering-a-repository/types-of-required-status-checks


In `.github/workflows/terraform.yaml`, replace the `TF_VAR_email_subscriber` variable with your own

  - you can use plaintext


## Issue

**Desired Outcome:**

  - have SNS resources's Region be configurable


Wanted to have SNS Topic and Subscription in 'us-east-2' using a second aws provider

Cloudwatch Alarms kept wanting to deploy in 'us-east-2' even when provider attribute  
was specifcaaly set on it


**Actual Outcome:**

  - I'm an idiot


Despite multiple sources stating it's possible to deploy the SNS and Cloudwatch  
resources into different Regions, it seems that it false.

Apparently the resources must be in the same Region

  - even though SNS has cross-region delivery

Time spent: an embarrassing amount

