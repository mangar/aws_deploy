class AwsDeploy::Notification


  # 
  # 
  # 
  def self.send to="all"
    @errors = []

    if to == "all"

      api_keys = $aws_deploy["pushbullet"]["api_key"]
      keys = api_keys.split(" ")

      keys.each_with_index do |k,i| 
        puts "-" * 100

        puts "#{i} - #{k}"

        puts "-" * 100  
      end

      begin
        _sendn(vals[0], vals[1])
      rescue Exception => e
        @errors << "Problem sending to: #{vals[0]}|#{vals[1]}|#{vals[2]} ... #{e}"
      end

    else


    end

    @errors
  end



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