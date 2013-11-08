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

    if (aws_secret?(params[:aws_secret][0]))

      message = _move_to params[:env]
      flash[:message] = "#{message}"

    else 
      flash[:message] = "AWS Secret is Invalid! ... #{params[:env]}"

    end

    redirect_to aws_deploy_root_path
  end


  private


  # 
  # 
  def _move_to environment
    
    message = "File sent to S3"
    if %w(admin stage production).include?(environment)

      AWS.config(:access_key_id => "#{_aws_access_key_id}", :secret_access_key => "#{_aws_secret_access_key}")
      s3 = AWS::S3.new
      bucket = s3.buckets["#{_aws_bucket}"]

      if bucket.objects[_md5_file("test")].exists?

          # remove files in production...
          bucket.objects[_md5_file("#{environment}")].delete if bucket.objects[_md5_file("#{environment}")].exists?
          bucket.objects[_zip_file("#{environment}")].delete if bucket.objects[_zip_file("#{environment}")].exists?

          # copying files from test to production
          bucket.objects[_md5_file("test")].copy_to(_md5_file("#{environment}"))
          bucket.objects[_zip_file("test")].copy_to(_zip_file("#{environment}"))

          message += " (#{environment})"

      else
        message = "Test file not found. #{_md5_file("test")}"
      end

    else 
      message = "Environment is not available!"
    end

    message
  end


end