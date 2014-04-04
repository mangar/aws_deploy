class AwsDeploy::NotificationsController < AwsDeploy::AwsDeployApplicationController
  layout "aws_deploy"

  # include AwsDeploy::Index::Version

  # 
  # 
  def index

  end


  # 
  # 
  def sendn

    @errors = []
    params.keys.each do |k|
      if k.starts_with?("item_")

        vals = params[k].split("|")

        begin
          _sendn(vals[0], vals[1])
        rescue Exception => e
          @errors << "Problem sending to: #{vals[0]}|#{vals[1]}|#{vals[2]} ... #{e}"
        end

      end
    end

    flash[:message] = "Push sent! - #{Time.now.strftime('%Y/%m/%d %H:%M:%S')}"
    flash[:errors] = @errors
    redirect_to :action => :index
  end



  private


  # 
  # 
  # 
  def _sendn token, device_name
    push = MyPush.new :token => token

    # find the device...
    iden = ""
    devices = push.devices
    devices["devices"].each do |dev|
      if device_name == dev["extras"]["model"]
        puts "ID: #{dev["iden"]}"
        iden = dev["iden"]
      end
    end

    # send a message..
    push.push :type => MyPush::PUSH_TYPE_NOTE, 
          :title => "[TEST][aws_deploy] #{Rails.application.class.parent_name} #{Rails.env}", 
          :body => "This is a test message sent from aws_deploy", 
          :iden => "#{iden}"

  end


end