class AwsDeploy::IndexController < AwsDeploy::AwsDeployApplicationController
  layout "aws_deploy"
  require "aws-sdk"

  include AwsDeploy::Index::Version
  include AwsDeploy::Index::Envs

  # 
  # 
  def index
    @exist_config = _exist_config?
    @version = _get_version_file()
    @envs = _get_envs()
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

    redirect_to aws_deploy_root_awsdeploy_path
  end


  private


  # 
  # 
  def _move_to environment
    
    message = "File sent to S3"
    # if %w(admin staging production).include?(environment)
    if _get_envs_code().include?(environment)

      AWS.config(:access_key_id => "#{_aws_access_key_id}", :secret_access_key => "#{_aws_secret_access_key}")
      s3 = AWS::S3.new
      bucket = s3.buckets["#{_aws_bucket}"]

      if bucket.objects[_md5_file("development_remote")].exists?

          # remove files in production...
          bucket.objects[_md5_file("#{environment}")].delete if bucket.objects[_md5_file("#{environment}")].exists?
          bucket.objects[_zip_file("#{environment}")].delete if bucket.objects[_zip_file("#{environment}")].exists?

          # copying files from test to production
          bucket.objects[_zip_file("development_remote")].copy_to(_zip_file("#{environment}"))
          bucket.objects[_md5_file("development_remote")].copy_to(_md5_file("#{environment}"))

          message += " (#{environment})"

          AwsDeploy::Notification.send("all", "#{$aws_deploy["project_name"]} - #{environment}", 
                                           "[#{environment}]\nA new deployment was scheduled.")

      else
        message = "DevelopmentRemote file not found. #{_md5_file("development_remote")}"
      end

    else 
      message = "Environment is not available!"
    end

    message
  end


end