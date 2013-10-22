class AwsDeploy::AwsDeployApplicationController < ApplicationController

  private

  # 
  # 
  def _exist_config?
    File.exist?(Rails.root.join("config/aws_deploy.yml"))
  end


end