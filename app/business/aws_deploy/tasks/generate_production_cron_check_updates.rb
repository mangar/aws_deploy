module AwsDeploy::Tasks::GenerateProductionCronCheckUpdates

  # 
  # 
  def generate_production_cron_check_updates
    
    content = 
        "#!/usr/bin/env ruby   \n" + 
        "#  \n" + 
        "require \"fileutils\" \n" + 
        "require \"aws-sdk\" \n" + 
        " \n" + 
        "# ------------------------------------------------------------------------------------- \n" + 
        "# CONFIGURABLE \n" + 
        "# ------------------------------------------------------------------------------------- \n" + 
        " \n" + 
        " AWS.config(:access_key_id => \"#{@aws_access_key_id}\", :secret_access_key => \"#{@aws_secret_access_key}\")     \n" + 
        " \n" + 
        "data_dir = \"#{@deploy_data_dir}\" \n" + 
        "file_pattern = \"#{@file_pattern}\" \n" + 
        "bucket = \"#{@aws_deploy_bucket}\" \n" + 
        " \n" + 
        "#  \n" + 
        "# ------------------------------------------------------------------------------------- \n" + 
        " \n" + 
        "s3_filename = \"nofile\" \n" + 
        " \n" + 
        "puts \"------------------------------------------------------------------------------ \" \n" + 
        " \n" + 
        "if \"\#{ARGV[0]}\".empty? \n" + 
        "  puts \"ERR - Process stoped. Environment not defined.\" \n" + 
        " \n" + 
        "else  \n" + 
        "  if !%w(admin development_remote production staging).include?(\"\#{ARGV[0]}\") \n" + 
        "    puts \"ERR - Invalid Environment: (\#{ARGV[0]})\" \n" + 
        "  else  \n" + 
        " \n" + 
        "    s3_filename = \"\#{file_pattern}-\#{ARGV[0]}.zip\" \n" + 
        "    s3_filename_md5 = \"\#{file_pattern}-\#{ARGV[0]}.md5\" \n" + 
        " \n" + 
        " \n" + 
        "    # # puts \"------------------------------------------------------------------------------ \" \n" + 
        "    puts \"1. Getting MD5 ... \#{bucket}/\#{s3_filename_md5}\" \n" + 
        "    # # puts \"------------------------------------------------------------------------------ \" \n" + 
        " \n" + 
        "    s3 = AWS::S3.new \n" + 
        "    bucket = s3.buckets[\"\#{bucket}\"] \n" + 
        " \n" + 
        "    obj = bucket.objects[s3_filename_md5] \n" + 
        " \n" + 
        "    if obj.exists? \n" + 
        "      File.delete(\"\#{data_dir}\#{s3_filename_md5}\") if File.exist?(\"\#{data_dir}\#{s3_filename_md5}\") \n" + 
        " \n" + 
        "      File.open(\"\#{data_dir}\#{s3_filename_md5}\", 'wb') do |file| \n" + 
        "        obj.read do |chunk| \n" + 
        "          file.write(chunk) \n" + 
        "        end \n" + 
        "      end \n" + 
        " \n" + 
        " \n" + 
        "      # # puts \"------------------------------------------------------------------------------ \" \n" + 
        "      puts \"2. Checking MD5 ... \" \n" + 
        " \n" + 
        "      # md5 checking... \n" + 
        "      md5_file_data = File.read(\"\#{data_dir}\#{s3_filename_md5}\") \n" + 
        " \n" + 
        "      if File.exist?(\"\#{data_dir}\#{s3_filename_md5}.local\") \n" + 
        "        md5_local = File.read(\"\#{data_dir}\#{s3_filename_md5}.local\") \n" + 
        "      else \n" + 
        "        md5_local = \"new__\#{md5_file_data}\" \n" + 
        "      end \n" + 
        " \n" + 
        "      puts \"  remote MD5: \#{md5_file_data}\" \n" + 
        "      puts \"  local MD5: \#{md5_local}\" \n" + 
        " \n" + 
        " \n" + 
        "      # process the deployment... \n" + 
        "      if md5_local != md5_file_data \n" + 
        "        # # puts \"------------------------------------------------------------------------------ \" \n" + 
        "        puts \"3. Downloading package \" \n" + 
        " \n" + 
        "        obj = bucket.objects[s3_filename] \n" + 
        " \n" + 
        "        if obj.exists? \n" + 
        " \n" + 
        "          File.open(\"\#{data_dir}\#{s3_filename}\", 'w+b') do |file| \n" + 
        "            obj.read do |chunk| \n" + 
        "              file.write(chunk) \n" + 
        "            end \n" + 
        "          end \n" + 
        " \n" + 
        "          # # puts \"------------------------------------------------------------------------------ \" \n" + 
        "          puts \"4. Writing controls ... .log and .md5.local files \" \n" + 
        " \n" + 
        " \n" + 
        "          system(\"echo \\\"\#{Time.now.strftime(\"%y%m%d_%H%M%S\")}\\\" >> \#{data_dir}\#{file_pattern}-\#{ARGV[0]}_YES.log\") \n" + 
        "          # updating local MD5   \n" + 
        "          File.open(\"\#{data_dir}\#{s3_filename_md5}.local\", 'w+') { |file| file.write(\"\#{md5_file_data}\") } \n " +
        " \n" +
        "          puts \"5. Deploying....\" \n" + 
        "          system(\"\#{data_dir}deploy.sh \#{ARGV[0]}\") \n " + 
        " \n" +
        "        else \n" +
        "          system(\"echo \\\"\#{Time.now.strftime(\"%y%m%d_%H%M%S\")}\\\" >> \#{data_dir}\#{file_pattern}-\#{ARGV[0]}_NO.log\")  \n" +
        "        end \n" +
        "      else \n" +
        "        system(\"echo \\\"\#{Time.now.strftime(\"%y%m%d_%H%M%S\")}\\\" >> \#{data_dir}\#{file_pattern}-\#{ARGV[0]}_NO.log\")  \n" +
        "      end  \n" +
        "    else  \n" +
        "      system(\"echo \\\"\#{Time.now.strftime(\"%y%m%d_%H%M%S\")}\\\" >> \#{data_dir}\#{file_pattern}-\#{ARGV[0]}_NO.log\")  \n" +
        "    end \n" + 
        " \n" + 
        "  end \n" + 
        " \n" + 
        "end \n" + 
        "puts \" ------------------------------------------------------------------------------ \"   \n"

    File.delete("#{Rails.root}/script/production/cron_check_updates.rb") if File.exists?("#{Rails.root}/script/production/cron_check_updates.rb")

    File.open("#{Rails.root}/script/production/cron_check_updates.rb", "w") do |f| 
      f.write("#{content}")
    end

    "#{Rails.root}/script/production/cron_check_updates.rb"
  end


end






