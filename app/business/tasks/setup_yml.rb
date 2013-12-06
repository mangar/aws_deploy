class Tasks::SetupYml

  # 
  # 
  def run

    collect_inputs

    # TODO(m)
    # fix the params, not copying to the file...

    # TODO(m)
    # generate the script dir with deploy.sh and lib dir (aws_send.rb, git_version_tag.rb)

    # 
    # aws_deploy.yml

    content = "development:\n" + 
"  aws_bucket: \"#{@aws_deploy_bucket}\" \n" + 
"  aws_access_key_id: \"#{@aws_access_key_id}\" \n" + 
"  aws_secret_access_key: \"#{@aws_secret_access_key}\" \n" + 
"  file_pattern: \"#{@file_pattern}\" \n" + 
"\n" + 
"development_remote: \n" + 
"  aws_bucket: \"#{@aws_deploy_bucket}\"\n" + 
"  aws_access_key_id: \"#{@aws_access_key_id}\"\n" + 
"  aws_secret_access_key: \"#{@aws_secret_access_key}\"\n" + 
"  file_pattern: \"#{@file_pattern}\"\n"

    File.delete("#{Rails.root}/config/aws_deploy.yml") if File.exists?("#{Rails.root}/config/aws_deploy.yml")

    File.open("#{Rails.root}/config/aws_deploy.yml", "w") do |f| 
      f.write("#{content}")
    end

    "#{Rails.root}/config/aws_deploy.yml"



  end


  # 
  # 
  def collect_inputs
    
    print "What is the of your AWS BUCKET ? [directory/deploy] :"
    @aws_deploy_bucket = STDIN.gets 
    @aws_deploy_bucket = (@aws_deploy_bucket.blank? ? "directory/deploy" : @aws_deploy_bucket)
    puts "#{@aws_deploy_bucket.gsub!("\n","")} \n"

    print "What is your AWS ACCESS KEY ID ? [my_key_id] :"
    @aws_access_key_id = STDIN.gets || "my_key_id"
    puts "#{@aws_access_key_id.gsub!("\n","")} \n"

    print "What is your AWS SECRET ACCESS KEY ? [my_secret_key] :"
    @aws_secret_access_key = STDIN.gets || "my_secret_key"
    puts "#{@aws_secret_access_key.gsub!("\n","")} \n"

    print "What is your FILE PATERN ? [my_file_before_zip_ext] :"
    @file_pattern = STDIN.gets || "my_file_before_zip_ext"
    puts "#{@file_pattern.gsub!("\n","")} \n"

  end


end


