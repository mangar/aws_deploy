class AwsDeploy::AwsDeployApplicationController < ActionController::Base

  # private

  # 
  # 
  def _exist_config?
    File.exist?(Rails.root.join("config/aws_deploy.yml"))
  end


  # 
  # 
  def _aws_access_key_id
    $aws_deploy['aws_access_key_id'].start_with?("ENV") ? eval($aws_deploy['aws_access_key_id']) : $aws_deploy['aws_access_key_id']
  end

  # 
  # 
  def _aws_secret_access_key
    $aws_deploy['aws_secret_access_key'].start_with?("ENV") ? eval($aws_deploy['aws_secret_access_key']) : $aws_deploy['aws_secret_access_key']
  end

  # 
  # 
  def _aws_bucket
    $aws_deploy['aws_bucket']
  end

  # 
  # 
  def _zip_file env=""
    "#{$aws_deploy['file_pattern']}-#{env}.zip"
  end

  def _md5_file env=""
    "#{$aws_deploy['file_pattern']}-#{env}.md5"
  end

  # 
  # 
  def aws_secret? aws_secret=""
    _aws_secret_access_key == aws_secret
  end

  # 
  # 
  # 
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == _aws_access_key_id && password == _aws_access_key_id
    end
  end


end