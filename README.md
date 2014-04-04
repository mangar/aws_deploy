

# AwsDeploy - 0.2.6.0
[![Gem Version](https://badge.fury.io/rb/aws_deploy.png)](http://badge.fury.io/rb/aws_deploy)

Push your app from _staging_ to _production_ server using S3 as a bridge


## Install

Install the gem using the bundle.... 

```
gem 'aws_deploy'
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
  pushbullet:
    api_key: PUSHBULLET_APIKEY_1 PUSHBULLET_APIKEY_2 PUSHBULLET_APIKEY_N

staging: 
  aws_bucket: "YOUR_BUCKET_ON_S3"
  aws_access_key_id: "YOUR_ACCESS_KEY or ENV['YOUR_KEY_EXPORTED']"
  aws_secret_access_key: "YOUR_SECRET_ACCESS_KEY or ENV['YOUR_KEY_EXPORTED']"
  file_pattern: FILE_NAME
  pushbullet:
    api_key: PUSHBULLET_APIKEY_1 PUSHBULLET_APIKEY_2 PUSHBULLET_APIKEY_N  

```


### Pushbullet integration

Every publish on all environment the API keys informed on aws_deploy.yml file will be notified.
Just add the API Key generated on your [account setting](https://www.pushbullet.com/account).

You can inform more than one, just add a space between each key.

Format:

    api_key|DEVICE NAME|Identification Name

Where:

1. ```api_key``` is your API Key generated on Pushbullet website (menu [Account Settings](https://www.pushbullet.com/account))
1. ```DEVICE NAME``` the device name listed in your [Device and Friends - logged in area](https://www.pushbullet.com/)
1. ```Identification Name``` Just an identification for that device, for instance: the owners name...


Sample:

    v1Y50OAUUEcDZKiVUtbiivJJ18HPatwazWujzCvGXFPuS|Chrome|My Computer at Company



## TODO

 - Show the version of the GEM (aws_deploy screen or specific URL)
 - Open field for environments 
 - Send email to responsibles to approve the deploy on environments
    - server side development required
 - Run rake on deployment process


## License

See LICENSE file for details