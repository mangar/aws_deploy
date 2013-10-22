# AwsDeploy

Push your app from _staging_ to _production_ server using S3 as a bridge


## Install

Install the gem.... 

```
gem install aws-deploy
```

... or add that on the bundle file (Gemfile)

```
gem 'aws_deploy'
```


__First access__


Run your site (rails server) and open the URL on your browser: [http://localhost:3000/aws_deploy](http://localhost:3000/aws_deploy)




## Initial Setup

Generate the basic setup by firing on command line:

```
rake aws:setup
```

Generated content:

- config/aws_deploy.yml


## Configuration

### aws_deploy.yml ###

```
development:
  aws_bucket: "YOUR_BUCKET_ON_S3"
  aws_access_key_id: "YOUR_ACCESS_KEY"
  aws_secret_access_key: "YOUR_SECRET_ACCESS_KEY"

staging: 
  aws_bucket: "YOUR_BUCKET_ON_S3"
  aws_access_key_id: "YOUR_ACCESS_KEY"
  aws_secret_access_key: "YOUR_SECRET_ACCESS_KEY"

producion:
  aws_bucket: "YOUR_BUCKET_ON_S3"
  aws_access_key_id: "YOUR_ACCESS_KEY"
  aws_secret_access_key: "YOUR_SECRET_ACCESS_KEY"

```








## Contribute

- Fork project
- Add features
- Run tests
- Send pull request

## License

See LICENSE file for details