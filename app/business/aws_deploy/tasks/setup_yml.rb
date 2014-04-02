class AwsDeploy::Tasks::SetupYml
  include AwsDeploy::Tasks::CollectInputs
  include AwsDeploy::Tasks::GenerateAwsDeploy
  include AwsDeploy::Tasks::GenerateLocalDeployRb
  include AwsDeploy::Tasks::GenerateAwsSendRb
  include AwsDeploy::Tasks::GenerateGitVersionTagRb
  include AwsDeploy::Tasks::GenerateProductionCronCheckUpdates
  include AwsDeploy::Tasks::GenerateProductionDeploySh
 
  # 
  # 
  def run

    collect_inputs

    # 
    # aws_deploy.yml
    # 
    puts "\n1. aws_deploy.yml"
    generate_aws_deploy



    puts "\n2. script dir"
    _script_dir


    # 
    # deploy.rb
    # 
    puts "\n3. deploy.rb"    
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


    # 
    # lib/production/cron_check_updates.rb
    # 
    puts "\n6. lib/production/cron_check_updates.rb"
    generate_production_cron_check_updates


    # 
    # lib/production/deploy.sh
    # 
    puts "\n7. lib/production/deploy.sh"
    generate_production_deploy_sh


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


