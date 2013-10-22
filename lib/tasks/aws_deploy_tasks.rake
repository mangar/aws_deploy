# desc "Explaining what the task does"
# task :aws_deploy do
#   puts "aws_deploy"
# end


namespace :aws do

  desc "Package and deploy the project on staging environment"

  task :staging => :environment do

    system("clear screen")

    puts "-" * 100
    puts "Starting deployment on Staging environment"


    puts "#{Deploy::Deploy.new.deploy_on_stage}"
    
  end



  # desc "TODO"
  # task :t2 => :environment do
  #   puts "t2.aws_deploy"
  # end

end

