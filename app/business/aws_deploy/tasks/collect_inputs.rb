module AwsDeploy::Tasks::CollectInputs

 
  # 
  # 
  def collect_inputs
    
    print "What is the name of your AWS BUCKET ? [directory/deploy] :"
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

    print "Name of your base dir? [/var/app/www] :"
    @deploy_base_dir = STDIN.gets 
    @deploy_base_dir = (@deploy_base_dir.blank? ? "/var/app/www" : @deploy_base_dir)
    puts "#{@deploy_base_dir.gsub!("\n","")} \n"

    print "Name of your data dir? [/var/app/aws_deploy] :"
    @deploy_data_dir = STDIN.gets 
    @deploy_data_dir = (@deploy_data_dir.blank? ? "/var/app/aws_deploy" : @deploy_data_dir)
    puts "#{@deploy_data_dir.gsub!("\n","")} \n"

    print "Name of your project? [directory/deploy] :"
    @project_name = STDIN.gets 
    @project_name = (@project_name.blank? ? "project_name" : @project_name)
    puts "#{@project_name.gsub!("\n","")} \n"

  end


end