class AwsDeploy::Tasks::SetupYml
  include AwsDeploy::Tasks::GenerateAwsDeploy
  include AwsDeploy::Tasks::GenerateLocalDeployRb

  # 
  # 
  def run

    # 
    # aws_deploy.yml
    # 
    puts "\n1."
    collect_inputs__aws_deploy
    generate_aws_deploy



    puts "\n2."
    _script_dir


    # 
    # deploy.rb
    # 
    puts "\n3."    
    collect_inputs__local_deploy_rb
    generate_local_deploy_rb


    



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


