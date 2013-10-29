$:.push File.expand_path("../lib", __FILE__)
require File.expand_path("../lib/aws_deploy/version", __FILE__)


# Maintain your gem's version:
require "aws_deploy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "aws_deploy"
  s.version     = AwsDeploy::VERSION
  s.authors     = ["Marcio Mangar"]
  s.email       = ["marcio.mangar@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of AwsDeploy."
  s.description = "TODO: Description of AwsDeploy."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "aws-sdk", "~> 1.21.0"

  # s.add_development_dependency "sqlite3"
end
