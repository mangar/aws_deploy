

# AwsDeploy - 0.2.5.1 
[![Gem Version](https://badge.fury.io/rb/aws_deploy.png)](http://badge.fury.io/rb/aws_deploy)

Push your app from _staging_ to _production_ server using S3 as a bridge


## Install

Install the gem using the bundle.... 

```
gem 'aws_deploy', :git => 'https://github.com/mangar/aws_deploy.git'
```

...and then:
```
bundle install
rake aws:setup
```


### First access


Run your site `rails server` and open the URL on your browser: [http://localhost:3000/aws_deploy](http://localhost:3000/aws_deploy)




## Initial Setup

Generate the basic setup by firing on command line:

```
rake aws:setup
```

Generated content:

- config/aws_deploy.yml
- script/deploy.rb
- script/production/cron_check_updates.rb
- script/production/deploy.sh
- script/lib/deploy/aws_send.rb
- script/lib/deploy/git_version_tag.rb
 


## Configuration

### aws_deploy.yml ###

The value of the fields aws_access_key_id and aws_secret_access_key can be the real value or the reference to the ENV variable.

The file_pattern will be added the environment and .zip or .md5.
Ex.:
file_pattern-test.zip and file_pattern-test.md5  for testing environment
file_pattern-prod.zip and file_pattern-prod.md5  for production environment


```
development:
  aws_bucket: "YOUR_BUCKET_ON_S3"
  aws_access_key_id: "YOUR_ACCESS_KEY or ENV['YOUR_KEY_EXPORTED']"
  aws_secret_access_key: "YOUR_SECRET_ACCESS_KEY or ENV['YOUR_KEY_EXPORTED']"
  file_pattern: FILE_NAME

staging: 
  aws_bucket: "YOUR_BUCKET_ON_S3"
  aws_access_key_id: "YOUR_ACCESS_KEY or ENV['YOUR_KEY_EXPORTED']"
  aws_secret_access_key: "YOUR_SECRET_ACCESS_KEY or ENV['YOUR_KEY_EXPORTED']"
  file_pattern: FILE_NAME

```




## TODO

 - Show the version of the GEM (aws_deploy screen or specific URL)
 - Open field for environments 
 - Send email to responsibles to approve the deploy on environments
    - server side development required
 - Changes to use 'fog' gem
    - AWS S3 implementation
    - Rackspace CloudFiles implementation


## License

See LICENSE file for details