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

    AWS.config(:access_key_id => "#{_aws_access_key_id}", :secret_access_key => "#{_aws_secret_access_key}")
    s3 = AWS::S3.new
    bucket = s3.buckets["#{_aws_bucket}"]

    if bucket.objects[_md5_file("test")].exists?

        # remove files in production...
        bucket.objects[_md5_file("prod")].delete if bucket.objects[_md5_file("prod")].exists?
        bucket.objects[_zip_file("prod")].delete if bucket.objects[_zip_file("prod")].exists?

        # copying files from test to production
        bucket.objects[_md5_file("test")].copy_to(_md5_file("prod"))
        bucket.objects[_zip_file("test")].copy_to(_zip_file("prod"))

    else
      flash_message = "Test file not found. #{_md5_file("test")}"
    end
    
    flash[:message] = "#{flash_message}"
    redirect_to aws_deploy_root_path
  end

end