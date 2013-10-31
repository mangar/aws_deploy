# if Rails.env != "production"

  puts "=> AWS Deploy loaded!"

  if File.exist?(File.expand_path('../../config/aws_deploy.yml', File.dirname(__FILE__)))

    settings = YAML.load(File.read(File.expand_path('../../config/aws_deploy.yml', File.dirname(__FILE__))))
    env = "#{ENV['RAILS_ENV']}".blank? ? "development" : "#{ENV['RAILS_ENV']}"
    $deployer_mg = settings["#{env}"]
    
  else
    puts "=> AWS Deploy NOT loaded!"
  end

