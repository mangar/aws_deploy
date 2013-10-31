class Tasks::SetupYml

  # 
  # 
  def run

    content = "development:\n" + 
"  aws_bucket: \"directory/deploy\" \n" + 
"  aws_access_key_id: \"YOUR_ACCESS_KEY_ID__HERE or ENV['YOUR_KEY_EXPORTED']\" \n" + 
"  aws_secret_access_key: \"YOUR_SECRET_ACCESS_KEY__HERE or ENV['YOUR_KEY_EXPORTED']\" \n" + 
"  file_pattern: \"FILE_NAME\" \n" + 
"\n" + 
"staging: \n" + 
"  aws_bucket: \"directory/deploy\"\n" + 
"  aws_access_key_id: \"YOUR_ACCESS_KEY_ID__HERE or ENV['YOUR_KEY_EXPORTED']\"\n" + 
"  aws_secret_access_key: \"YOUR_SECRET_ACCESS_KEY__HERE or ENV['YOUR_KEY_EXPORTED']\"\n" + 
"  file_pattern: \"FILE_NAME\"\n"

    File.delete("#{Rails.root}/config/aws_deploy.yml") if File.exists?("#{Rails.root}/config/aws_deploy.yml")

    File.open("#{Rails.root}/config/aws_deploy.yml", "w") do |f| 
      f.write("#{content}")
    end

  end


end


