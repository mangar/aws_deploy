class AwsDeploy::Tasks::SetupYml
  include AwsDeploy::Tasks::GenerateAwsDeploy
  include AwsDeploy::Tasks::GenerateLocalDeployRb
  include AwsDeploy::Tasks::GenerateAwsSendRb
  include AwsDeploy::Tasks::GenerateGitVersionTagRb

  # 
  # 
  def run

    # 
    # aws_deploy.yml
    # 
    puts "\n1. aws_deploy.rb"
    collect_inputs__aws_deploy
    generate_aws_deploy



    puts "\n2. script dir"
    _script_dir


    # 
    # deploy.rb
    # 
    puts "\n3. deploy.rb"    
    collect_inputs__local_deploy_rb
    generate_local_deploy_rb


    # 
    # lib/deploy/aws_send.rb
    # 
    puts "\n4. lib/deploy/aws_send.rb"
    generate_local_aws_send_rb


    # 
    # lib/deploy/git_version_tag.rb
    # 
    puts "\n5. lib/deploy/git_version_tag.rb"
    generate_local_git_version_tag_rb


    # TODO(m)
    # generate the script dir with deploy.sh and lib dir (aws_send.rb, git_version_tag.rb)


  end



  private 

    # 
    # 
    def _script_dir
      if Dir.exists?("#{Rails.root}/script")
         FileUtils.rm_r("#{Rails.root}/script")
      end
      puts "Creating script directory..."
      puts "  /script/lib/deploy"
      FileUtils.mkdir_p("#{Rails.root}/script/lib/deploy")

      puts "  /script/production"
      FileUtils.mkdir_p("#{Rails.root}/script/production")

      puts "  /script/security"
      FileUtils.mkdir_p("#{Rails.root}/script/security")
    end



end


