module AwsDeploy::Tasks::GenerateAwsDeploy

  # 
  # 
  def generate_aws_deploy
    
    content = "development:\n" + 
      "  project_name: \"YOUR_PROJECT_NAME\" \n" + 
      "  aws_bucket: \"#{@aws_deploy_bucket}\" \n" + 
      "  aws_access_key_id: \"#{@aws_access_key_id}\" \n" + 
      "  aws_secret_access_key: \"#{@aws_secret_access_key}\" \n" + 
      "  file_pattern: \"#{@file_pattern}\" \n" + 
      "  pushbullet: \n" + 
      "    api_key: xxxx|Chrome|MG.Chrome \n" +
      "  envs: Staging|staging Admin|admin Production|production \n" + 
      "\n" + 
      "development_remote: \n" + 
      "  project_name: \"YOUR_PROJECT_NAME\" \n" + 
      "  aws_bucket: \"#{@aws_deploy_bucket}\"\n" + 
      "  aws_access_key_id: \"#{@aws_access_key_id}\"\n" + 
      "  aws_secret_access_key: \"#{@aws_secret_access_key}\"\n" + 
      "  file_pattern: \"#{@file_pattern}\"\n"
      "  pushbullet: \n" + 
      "    api_key: xxxxx|Chrome|MG.Chrome \n" +
      "  envs: Staging|staging Admin|admin Production|production \n"

    File.delete("#{Rails.root}/config/aws_deploy.yml") if File.exists?("#{Rails.root}/config/aws_deploy.yml")

    File.open("#{Rails.root}/config/aws_deploy.yml", "w") do |f| 
      f.write("#{content}")
    end

    "#{Rails.root}/config/aws_deploy.yml"
  end




end