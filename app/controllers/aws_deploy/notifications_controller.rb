class AwsDeploy::NotificationsController < AwsDeploy::AwsDeployApplicationController
  layout "aws_deploy"

  def index
  end


  # 
  # 
  def sendn
    @errors = AwsDeploy::Notification.send("all", 
                                           "[TEST][aws_deploy] #{Rails.application.class.parent_name} #{Rails.env}", 
                                           "This is a test message sent from aws_deploy")

    flash[:message] = "Push sent! - #{Time.now.strftime('%Y/%m/%d %H:%M:%S')}"
    flash[:errors] = @errors
    redirect_to :action => :index
  end


end