class AwsDeploy::Notification


  # 
  # 
  # 
  def self.send to="all", title="subject", message="message"
    @errors = []
    vals = []
    if to == "all"

      api_keys = $aws_deploy["pushbullet"]["api_key"]
      keys = api_keys.split(" ")


      begin

        keys.each_with_index do |k,i| 
          puts "-" * 100
          puts "#{i} - #{k}"
          vals = k.split("|")
          puts "-" * 100  

        AwsDeploy::Notification.sendn(vals[0], vals[1], title, message)

        end
      rescue Exception => e
        @errors << "Problem sending to: #{vals[0]}|#{vals[1]}|#{vals[2]} ... #{e}"
      end

    end

    @errors
  end



  # 
  # 
  # 
  def self.sendn token, device_name, title="", message=""
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
          :title => "#{title}", 
          :body => "#{message}", 
          :iden => "#{iden}"

  end

end