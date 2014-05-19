# desc "Explaining what the task does"
# task :aws_deploy do
#   puts "aws_deploy"
# end


namespace :aws do

  desc "Create the initial aws_deploy.yml file"

  # 
  # 
  # 
  task :setup => :environment do
    system("clear screen")
    puts "-" * 100

    puts "Generating aws_deploy.yml file"
    puts "#{AwsDeploy::Tasks::SetupYml.new.run}"

    
    puts "-" * 100
  end


  # 
  # 
  task :notifty_deploy => :environment do 
    AwsDeploy::Notification.send("all", "#{$aws_deploy["project_name"]} - [development_remote]", "[development_remote]\nA new deployment was scheduled.")
  end

end

