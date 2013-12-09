module AwsDeploy::Tasks::GenerateProductionDeploySh

  # 
  # 
  def generate_production_deploy_sh
    
    content = 
        ""

        # TODO(m)
        # implement it...

    # File.delete("#{Rails.root}/script/lib/deploy/git_version_tag.rb") if File.exists?("#{Rails.root}/script/lib/deploy/git_version_tag.rb")

    # File.open("#{Rails.root}/script/lib/deploy/git_version_tag.rb", "w") do |f| 
    #   f.write("#{content}")
    # end

    # "#{Rails.root}/script/lib/deploy/git_version_tag.rb"
  end


end



# #!/bin/bash
# #
# # Usage:
# # ./deploy.sh [app|test2]
# #
# #
# # 
# # Author: Marcio Garcia (marcio.garcia@rga.com)
# #
# # Description:
# # This program deploys the app into the server. Following these steps:
# # 1 - unpack .zip file localy
# # 2 - copy data to the app dir
# # 3 - replace local configurations
# # 4 - relink 'current'
# # 5 - restart nginx
# #


# DATA_DIR=/app/deploy
# ZIP_FILE_NAME=samsung-g11.zip
# UNPACK_DIR=$DATA_DIR/tmp/unpack_playliststore
# HOST=`hostname`
# NOW=$(date +"%y%m%d-%H%M%S")

# BASE_DEPLOY_DIR=/app/www
# clear screen

# TODAY=$(date)


# ENV=$1

# if [ "$1" == "" ] 
# then
#   echo "***********************************************************************************"
#   echo " "
#   echo " !!!! PROCESS CANCELED !!!! "
#   echo " "
#   echo " INFORM A VALID ENVIRONMENT [production|staging|development_remote|admin]"
#   echo " "
#   echo " onde:"
#   echo " "
#   echo " production          => www.playliststore.com"
#   echo " staging             => staging.playliststore.com"  
#   echo " development_remote  => test.playliststore.com"
#   echo " admin               => admin.playliststore.com"  
#   echo " "
#   echo "***********************************************************************************"
#   exit
# else
#   if [ "$1" == "admin" ] 
#   then
#     export RAILS_ENV=production
#     ZIP_FILE_NAME=playliststore-admin.zip
#     BASE_DEPLOY_DIR=$BASE_DEPLOY_DIR/admin.playliststore.com.br
#   fi  
#   if [ "$1" == "development_remote" ] 
#   then
#     export RAILS_ENV=development_remote
#     ZIP_FILE_NAME=playliststore-development_remote.zip
#     BASE_DEPLOY_DIR=$BASE_DEPLOY_DIR/test.playliststore.com.br
#   fi  
#   if [ "$1" == "staging" ] 
#   then
#     export RAILS_ENV=staging
#     ZIP_FILE_NAME=playliststore-staging.zip
#     BASE_DEPLOY_DIR=$BASE_DEPLOY_DIR/staging.playliststore.com.br
#   fi  
#   if [ "$1" == "production" ] 
#   then
#     export RAILS_ENV=production
#     ZIP_FILE_NAME=playliststore-production.zip
#     BASE_DEPLOY_DIR=$BASE_DEPLOY_DIR/www.playliststore.com.br
#   fi  

# fi


# echo "-----------------------------------------------------------------------------------"
# echo "BASE DEPLOY DIR: $BASE_DEPLOY_DIR "
# echo "--"
# echo "1 - Unpack .zip file ($ZIP_FILE_NAME) - $TODAY"
# # echo "-----------------------------------------------------------------------------------"

# rm -rf $UNPACK_DIR-$ENV-$HOST

# unzip -q $DATA_DIR/$ZIP_FILE_NAME -d $UNPACK_DIR-$ENV-$HOST



# # echo "-----------------------------------------------------------------------------------"
# echo "2 - Copy data to the app dir - $TODAY"
# # echo "-----------------------------------------------------------------------------------"

# cp -rf $UNPACK_DIR-$ENV-$HOST/ $BASE_DEPLOY_DIR/$NOW



# # # echo "-----------------------------------------------------------------------------------"
# echo "3 - relink 'current' - $TODAY"
# # # echo "-----------------------------------------------------------------------------------"

# cd $BASE_DEPLOY_DIR
# rm html
# ln -s $NOW html
# cd -



# echo "- run bundle exec rake assets:precompile - $TODAY"
# cd $BASE_DEPLOY_DIR/html


# bundle update


# echo "- npm, bower and grunt @ yeoman-mobile - $TODAY"
# cd yeoman-mobile
# sudo npm install
# bower install
# grunt

# cd -
# sudo rm -rf yeoman-mobile


# echo "- npm, bower and grunt @ yeoman-totem - $TODAY"
# cd yeoman-totem
# sudo npm install
# bower install
# grunt


# cd -
# sudo rm -rf yeoman-totem

# rake db:migrate

# export RAILS_ENV=production
# bundle exec rake assets:precompile


# # echo "-----------------------------------------------------------------------------------"
# echo "4 - Restarting NGINX - $TODAY"
# # echo "-----------------------------------------------------------------------------------"

# # nginx_restart
# sudo service nginx restart

# # redis restart + flushall
# redis-cli FLUSHALL
# sudo service redis-server restart
# redis-cli FLUSHALL


# echo ""
# echo ""
# echo "FINISHED! - $TODAY "
# echo ""
# echo ""
