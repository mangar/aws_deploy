class AwsDeploy::IndexController < AwsDeploy::AwsDeployApplicationController
  layout "aws_deploy"

  require "aws-sdk"

  # 
  # 
  def index
    @exist_config = _exist_config?
  end

  # 
  # 
  def send_to_production

    flash_message = "File sent to S3"

    AWS.config(:access_key_id => "#{$deployer_mg['aws_access_key_id']}", :secret_access_key => "#{$deployer_mg['aws_secret_access_key']}")
    s3 = AWS::S3.new
    bucket = s3.buckets["#{$deployer_mg['aws_bucket']}"]

    s3_filename = "samsung-g11-$1.zip"
    s3_filename_md5 = "samsung-g11-$1.md5"

    if bucket.objects[s3_filename_md5.gsub("$1", "test")].exists?

        # remove files in production...
        bucket.objects[s3_filename_md5.gsub("$1", "prod")].delete if bucket.objects[s3_filename_md5.gsub("$1", "prod")].exists?
        bucket.objects[s3_filename.gsub("$1", "prod")].delete if bucket.objects[s3_filename.gsub("$1", "prod")].exists?

        # copying files from test to production
        bucket.objects[s3_filename_md5.gsub("$1", "test")].copy_to(s3_filename_md5.gsub("$1", "prod"))
        bucket.objects[s3_filename.gsub("$1", "test")].copy_to(s3_filename.gsub("$1", "prod"))

    else
      flash_message = "Test file not found. #{s3_filename_md5.gsub("$1", "test")}"
    end
    
    
    flash[:message] = "#{flash_message}"
    redirect_to aws_deploy_root_path
  end

end