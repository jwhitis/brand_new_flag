CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              "AWS",
    aws_access_key_id:     AppConfig["aws_access_key_id"],
    aws_secret_access_key: AppConfig["aws_secret_access_key"]
  }
  config.fog_directory = AppConfig["aws_bucket"]
  config.fog_use_ssl_for_aws = false # Bucket names containing periods do not work with SSL
end