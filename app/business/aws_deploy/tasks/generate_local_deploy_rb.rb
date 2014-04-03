module AwsDeploy::Tasks::GenerateLocalDeployRb


  # 
  # 
  def generate_local_deploy_rb

    content = 
      "#!/usr/bin/env ruby \n" + 
      "# \n" + 
      "require 'FileUtils' \n" + 
      "require './lib/deploy/git_version_tag.rb' \n" + 
      "require './lib/deploy/aws_send.rb' \n" + 
      " \n" + 
      "# ------------------------------------------------------------------------------------- \n" + 
      "# CONFIGURABLE \n" + 
      "# ------------------------------------------------------------------------------------- \n" + 
      " \n" + 
      "zip_file = \"#{@file_pattern}\" \n" + 
      "md5_file = \"\#{zip_file}\" \n" + 
      " \n" + 
      "aws_access_key_id = \"#{@aws_access_key_id}\" \n" + 
      "aws_secret_access_key = \"#{@aws_secret_access_key}\" \n" + 
      "aws_bucket = \"#{@aws_deploy_bucket}\" \n" + 
      " \n" + 
      "_temp_dir = \"\#{File.expand_path(\"~\")}/Temp/#{@project_name}\" \n" +
      " \n" + 
      "# \n" + 
      "# ------------------------------------------------------------------------------------- \n" + 
      " \n" + 
      " \n" + 
      "time = Time.now.strftime(\"%y%m%d.%H%M%S\") \n" + 
      "public_dir = Dir.new(\"../public\") \n" + 
      " \n" + 
      "Dir.mkdir(_temp_dir) unless File.directory?(_temp_dir) \n" + 
      "temp_dir = \"\#{_temp_dir}/\#{time}\" \n" + 
      "# env = ARGV[0] \n" + 
      " \n" + 
      " \n" + 
      " \n" + 
      "puts \"------------------------------------------------------------------------------ \" \n" + 
      " \n" + 
      " \n" + 
      "# puts \"------------------------------------------------------------------------------ \" \n" + 
      "puts \"3. Version.txt\" \n" + 
      "# puts \"------------------------------------------------------------------------------ \" \n" + 
      " \n" + 
      "GitVersionTag.new(time, \"gitlab\", public_dir.path).version_it \n" + 
      " \n" + 
      " \n" + 
      " \n" + 
      "# puts \"------------------------------------------------------------------------------ \" \n" + 
      "puts \"2. Git tag\" \n" + 
      "# puts \"------------------------------------------------------------------------------ \" \n" + 
      " \n" + 
      "GitVersionTag.new(time, \"gitlab\", public_dir.path).tag_it \n" + 
      " \n" + 
      " \n" + 
      "# puts \"------------------------------------------------------------------------------ \" \n" + 
      "puts \"3. Packing\" \n" + 
      "# puts \"------------------------------------------------------------------------------ \" \n" + 
      " \n" + 
      " \n" + 
      " \n" + 
      "# puts \"------------------------------------------------------------------------------ \" \n" + 
      "puts \"3.1 - Copying content to a temporary folder - \#{Time.now}\" \n" + 
      "# puts \"------------------------------------------------------------------------------ \" \n" + 
      " \n" + 
      "Dir.mkdir(\"\#{temp_dir}\") \n" + 
      " \n" + 
      "exclude_dirs = [] \n" + 
      "exclude_dirs << \"ie7ref\" \n" + 
      "exclude_dirs << \".git\" \n" + 
      "exclude_dirs << \".gitignore\" \n" + 
      "exclude_dirs << \".autotest\" \n" + 
      "exclude_dirs << \"tmp\" \n" + 
      "exclude_dirs << \"doc\" \n" + 
      "exclude_dirs << \".svn\" \n" + 
      "exclude_dirs << \"wip\" \n" + 
      "exclude_dirs << \"log/*\" \n" + 
      "exclude_dirs << \"test/*\" \n" + 
      "exclude_dirs << \"script/security/*\" \n" + 
      "exclude_dirs << \"README.rdoc\" \n" + 
      "exclude_dirs << \"public/app\" \n" + 
      " \n" + 
      "rsync_command = \"rsync -avz --exclude '\#{exclude_dirs.join(\"' --exclude '\")}' ../ \#{temp_dir}\" \n" +
      "system(\"\#{rsync_command}\") \n" + 
      " \n" + 
      " \n" + 
      " \n" + 
      " \n" + 
      " \n" + 
      " \n" + 
      "# puts \"------------------------------------------------------------------------------ \" \n" + 
      "puts \"3.2 - Generating package - \#{Time.now}\" \n" + 
      "# puts \"------------------------------------------------------------------------------ \" \n" + 
      " \n" + 
      "system(\"cd \#{temp_dir}; bundle install\") \n" + 
      "system(\"cd \#{temp_dir}; bundle exec rake assets:precompile --trace\") \n" + 
      "# system(\"rm -rf \#{temp_dir}/public/assets\") \n" + 
      "system(\"rm -rf \#{temp_dir}/../\#{zip_file}.zip\") \n" + 
      "system(\"cd \#{temp_dir}; zip -qr ../\#{zip_file}.zip ./*\") \n" + 
      " \n" + 
      " \n" + 
      " \n" + 
      " \n" + 
      "# puts \"------------------------------------------------------------------------------ \" \n" + 
      "puts \"3.3 - Generating MD5 - \#{Time.now}\" \n" + 
      "# puts \"------------------------------------------------------------------------------ \" \n" + 
      " \n" + 
      "system(\"rm -rf \#{temp_dir}/../\#{md5_file}.md5\") \n" + 
      "system(\"cd \#{temp_dir}; md5 <<< \\\"\#{Time.now}\\\" >> ../\#{md5_file}.md5\") \n" + 
      " \n" + 
      " \n" + 
      " \n" + 
      "# puts \"------------------------------------------------------------------------------ \" \n" + 
      "puts \"4. AWS Send\" \n" + 
      "# puts \"------------------------------------------------------------------------------ \" \n" + 
      " \n" + 
      "AwsSend.new(aws_access_key_id, aws_secret_access_key).send(\"\#{temp_dir}/../\#{zip_file}.zip\", aws_bucket) \n" + 
      "AwsSend.new(aws_access_key_id, aws_secret_access_key).send(\"\#{temp_dir}/../\#{md5_file}.md5\", aws_bucket) \n" + 
      " \n" + 
      " \n" + 
      "puts \"------------------------------------------------------------------------------ \" \n"


        
    File.delete("#{Rails.root}/script/deploy.rb") if File.exists?("#{Rails.root}/script/deploy.rb")

    File.open("#{Rails.root}/script/deploy.rb", "w") do |f| 
      f.write("#{content}")
    end

    "#{Rails.root}/script/deploy.rb"
  end














end
