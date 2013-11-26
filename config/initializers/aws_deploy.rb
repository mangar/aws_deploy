
puts "=> AWS Deploy loaded!"

if File.exist?(Rails.root.join("config/aws_deploy.yml"))
  settings = YAML.load(File.read(File.expand_path(Rails.root.join("config/aws_deploy.yml"), File.dirname(__FILE__))))
  env = "#{ENV['RAILS_ENV']}".blank? ? "development" : "#{ENV['RAILS_ENV']}"
  $aws_deploy = settings["#{env}"]
else
  puts "=" * 80
  puts ""
  puts "                  AWS DEPLOY NOT LOADED!"
  puts ""
  puts ""
  puts "   If you do not have the aws_deploy.yml file into config directory, run it:"
  puts "                      rake aws:setup" 
  puts "   This command will setup the environment for aws_deploy gem."
  puts ""
  puts "=" * 80
end
