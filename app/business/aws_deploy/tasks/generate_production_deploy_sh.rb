module AwsDeploy::Tasks::GenerateProductionDeploySh

  # 
  # 
  def generate_production_deploy_sh
    
    content = 
      "#!/bin/bash \n " + 
      "# \n " + 
      "# Usage: \n " + 
      "# ./deploy.sh [app|test2] \n " + 
      "# \n " + 
      "# \n " + 
      " \n " + 
      " \n " + 
      "DATA_DIR=/app/deploy \n " + 
      "ZIP_FILE_NAME=samsung-g11.zip \n " + 
      "UNPACK_DIR=$DATA_DIR/tmp/unpack_playliststore \n " + 
      "HOST=`hostname` \n " + 
      "NOW=$(date +\"%y%m%d-%H%M%S\") \n " + 
      " \n " + 
      "BASE_DEPLOY_DIR=/app/www \n " + 
      "clear screen \n " + 
      " \n " + 
      "TODAY=$(date) \n " + 
      " \n " + 
      " \n " + 
      "ENV=$1 \n " + 
      " \n " + 
      "if [ \"$1\" == \"\" ]  \n " + 
      "then \n " + 
      "  echo \"***********************************************************************************\" \n " + 
      "  echo \" \" \n " + 
      "  echo \" !!!! PROCESS CANCELED !!!! \" \n " + 
      "  echo \" \" \n " + 
      "  echo \" INFORM A VALID ENVIRONMENT [production|staging|development_remote|admin]\" \n " + 
      "  echo \" \" \n " + 
      "  echo \" onde:\" \n " + 
      "  echo \" \" \n " + 
      "  echo \" production          => www.playliststore.com\" \n " + 
      "  echo \" staging             => staging.playliststore.com\"   \n " + 
      "  echo \" development_remote  => test.playliststore.com\" \n " + 
      "  echo \" admin               => admin.playliststore.com\"   \n " + 
      "  echo \" \" \n " + 
      "  echo \"***********************************************************************************\" \n " + 
      "  exit \n " + 
      "else \n " + 
      "  if [ \"$1\" == \"admin\" ]  \n " + 
      "  then \n " + 
      "    export RAILS_ENV=production \n " + 
      "    ZIP_FILE_NAME=playliststore-admin.zip \n " + 
      "    BASE_DEPLOY_DIR=$BASE_DEPLOY_DIR/admin.playliststore.com.br \n " + 
      "  fi   \n " + 
      "  if [ \"$1\" == \"development_remote\" ]  \n " + 
      "  then \n " + 
      "    export RAILS_ENV=development_remote \n " + 
      "    ZIP_FILE_NAME=playliststore-development_remote.zip \n " + 
      "    BASE_DEPLOY_DIR=$BASE_DEPLOY_DIR/test.playliststore.com.br \n " + 
      "  fi   \n " + 
      "  if [ \"$1\" == \"staging\" ]  \n " + 
      "  then \n " + 
      "    export RAILS_ENV=staging \n " + 
      "    ZIP_FILE_NAME=playliststore-staging.zip \n " + 
      "    BASE_DEPLOY_DIR=$BASE_DEPLOY_DIR/staging.playliststore.com.br \n " + 
      "  fi   \n " + 
      "  if [ \"$1\" == \"production\" ]  \n " + 
      "  then \n " + 
      "    export RAILS_ENV=production \n " + 
      "    ZIP_FILE_NAME=playliststore-production.zip \n " + 
      "    BASE_DEPLOY_DIR=$BASE_DEPLOY_DIR/www.playliststore.com.br \n " + 
      "  fi   \n " + 
      " \n " + 
      "fi \n " + 
      " \n " + 
      " \n " + 
      "echo \"-----------------------------------------------------------------------------------\" \n " + 
      "echo \"BASE DEPLOY DIR: $BASE_DEPLOY_DIR \" \n " + 
      "echo \"--\" \n " + 
      "echo \"1 - Unpack .zip file ($ZIP_FILE_NAME) - $TODAY\" \n " + 
      "# echo \"-----------------------------------------------------------------------------------\" \n " + 
      " \n " + 
      "rm -rf $UNPACK_DIR-$ENV-$HOST \n " + 
      " \n " + 
      "unzip -q $DATA_DIR/$ZIP_FILE_NAME -d $UNPACK_DIR-$ENV-$HOST \n " + 
      " \n " + 
      " \n " + 
      " \n " + 
      "# echo \"-----------------------------------------------------------------------------------\" \n " + 
      "echo \"2 - Copy data to the app dir - $TODAY\" \n " + 
      "# echo \"-----------------------------------------------------------------------------------\" \n " + 
      " \n " + 
      "cp -rf $UNPACK_DIR-$ENV-$HOST/ $BASE_DEPLOY_DIR/$NOW \n " + 
      " \n " + 
      " \n " + 
      " \n " + 
      "# # echo \"-----------------------------------------------------------------------------------\" \n " + 
      "echo \"3 - relink 'current' - $TODAY\" \n " + 
      "# # echo \"-----------------------------------------------------------------------------------\" \n " + 
      " \n " + 
      "cd $BASE_DEPLOY_DIR \n " + 
      "rm html \n " + 
      "ln -s $NOW html \n " + 
      "cd - \n " + 
      " \n " + 
      " \n " + 
      " \n " + 
      "echo \"- run bundle exec rake assets:precompile - $TODAY\" \n " + 
      "cd $BASE_DEPLOY_DIR/html \n " + 
      " \n " + 
      " \n " + 
      "bundle update \n " + 
      " \n " + 
      " \n " + 
      "rake db:migrate \n " + 
      " \n " + 
      "export RAILS_ENV=production \n " + 
      "bundle exec rake assets:precompile \n " + 
      " \n " + 
      " \n " + 
      "# echo \"-----------------------------------------------------------------------------------\" \n " + 
      "echo \"4 - Restarting NGINX - $TODAY\" \n " + 
      "# echo \"-----------------------------------------------------------------------------------\" \n " + 
      " \n " + 
      "# nginx_restart \n " + 
      "sudo service nginx restart \n " + 
      " \n " + 
      " \n " + 
      " \n " + 
      "echo \"\" \n " + 
      "echo \"\" \n " + 
      "echo \"FINISHED! - $TODAY \" \n " + 
      "echo \"\" \n " + 
      "echo \"\" \n "

    File.delete("#{Rails.root}/script/production/deploy.sh") if File.exists?("#{Rails.root}/script/production/deploy.sh")

    File.open("#{Rails.root}/script/production/deploy.sh", "w") do |f| 
      f.write("#{content}")
    end

    "#{Rails.root}/script/production/deploy.sh"
  end


end

