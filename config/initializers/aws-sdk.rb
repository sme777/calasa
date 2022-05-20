require 'aws-sdk-core'

Aws.config.update(
  region: 'us-west-2',
  credentials: Aws::Credentials.new(Rails.application.credentials.config[:S3_KEY], 
                Rails.application.credentials.config[:S3_SECRET_KEY])
)