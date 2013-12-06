module AwsDeploy::Tasks::GenerateAwsSendRb

  # 
  # 
  def generate_local_aws_send_rb
    
    content = 
      "require \"fileutils\" \n" + 
      "require \"aws-sdk\" \n" + 
      " \n" + 
      "class AwsSend \n" + 
      " \n" + 
      "  DEFAULT_ENV = \"development_remote\" \n" + 
      " \n" + 
      "  def initialize access_key_id=\"\", secret_access_key=\"\" \n" + 
      "    AWS.config(:access_key_id => \"\#{access_key_id}\", :secret_access_key => \"\#{secret_access_key}\")     \n" + 
      "  end \n" + 
      " \n" + 
      "  #  \n" + 
      "  #  \n" + 
      "  def send file_name=\"\", bucket_path=\"\" \n" + 
      "    puts \"File: \#{file_name} ... bucket: \#{bucket_path}\" \n" + 
      " \n" + 
      "    s3 = AWS::S3.new \n" + 
      "    bucket = s3.buckets[\"\#{bucket_path}\"] \n" + 
      " \n" + 
      "    base_file_name = \"\#{File.basename(file_name, \".*\")}-\#{AwsSend::DEFAULT_ENV}\#{File.extname(file_name)}\" \n" + 
      "    puts \"  ... new file name: \#{base_file_name}\" \n" + 
      " \n" + 
      "    obj = bucket.objects[base_file_name] \n" + 
      "    obj.delete \n" + 
      "    obj.write(Pathname.new(\"\#{file_name}\")) \n" + 
      " \n" + 
      "  end \n" + 
      " \n" + 
      "end \n"


    File.delete("#{Rails.root}/script/lib/deploy/aws_send.rb") if File.exists?("#{Rails.root}/script/lib/deploy/aws_send.rb")

    File.open("#{Rails.root}/script/lib/deploy/aws_send.rb", "w") do |f| 
      f.write("#{content}")
    end

    "#{Rails.root}/script/lib/deploy/aws_send.rb"
  end


end