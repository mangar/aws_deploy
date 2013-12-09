module AwsDeploy::Tasks::GenerateProductionCronCheckUpdates

  # 
  # 
  def generate_production_cron_check_updates
    
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




# #!/usr/bin/env ruby
# # 
# require "fileutils"
# require "aws-sdk"

# # -------------------------------------------------------------------------------------
# # CONFIGURABLE
# # -------------------------------------------------------------------------------------

# AWS.config(:access_key_id => "AKIAINBZHA2V3JXKEKAA", :secret_access_key => "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")

# base_dir = "/app/deploy/"
# project_name = "playliststore"
# bucket = "playliststore/deploy"

# # 
# # -------------------------------------------------------------------------------------

# s3_filename = "nofile"

# puts "------------------------------------------------------------------------------ \n\n"

# if "#{ARGV[0]}".empty?
#   puts "ERR - Process stoped. Environment not defined."

# else 
#   if !%w(admin development_remote production staging).include?("#{ARGV[0]}")
#     puts "ERR - Invalid Environment: (#{ARGV[0]})"
#   else 

#     s3_filename = "#{project_name}-#{ARGV[0]}.zip"
#     s3_filename_md5 = "#{project_name}-#{ARGV[0]}.md5"


#     # # puts "------------------------------------------------------------------------------ "
#     puts "1. Getting MD5 ... #{bucket}/#{s3_filename_md5}"
#     # # puts "------------------------------------------------------------------------------ "

#     s3 = AWS::S3.new
#     bucket = s3.buckets["#{bucket}"]

#     obj = bucket.objects[s3_filename_md5]

#     if obj.exists?
#       File.delete("#{base_dir}#{s3_filename_md5}") if File.exist?("#{base_dir}#{s3_filename_md5}")

#       File.open("#{base_dir}#{s3_filename_md5}", 'wb') do |file|
#         obj.read do |chunk|
#           file.write(chunk)
#         end
#       end


#       # # puts "------------------------------------------------------------------------------ "
#       puts "2. Checking MD5 ... "

#       # md5 checking...
#       md5_file_data = File.read("#{base_dir}#{s3_filename_md5}")

#       if File.exist?("#{base_dir}#{s3_filename_md5}.local")
#         md5_local = File.read("#{base_dir}#{s3_filename_md5}.local")
#       else
#         md5_local = "new__#{md5_file_data}"
#       end

#       puts "  remote MD5: #{md5_file_data}"
#       puts "  local MD5: #{md5_local}"


#       # process the deployment...
#       if md5_local != md5_file_data
#         # # puts "------------------------------------------------------------------------------ "
#         puts "3. Downloading package "

#         obj = bucket.objects[s3_filename]

#         if obj.exists?
          
#           File.open("#{base_dir}#{s3_filename}", 'w+b') do |file|
#             obj.read do |chunk|
#               file.write(chunk)
#             end
#           end

#           # # puts "------------------------------------------------------------------------------ "
#           puts "4. Writing controls ... .log and .md5.local files "


#           system("echo \"#{Time.now.strftime("%y%m%d_%H%M%S")}\" >> #{base_dir}#{project_name}-#{ARGV[0]}_YES.log")
#           # updating local MD5
#           File.open("#{base_dir}#{s3_filename_md5}.local", 'w+') { |file| file.write("#{md5_file_data}") }

#           puts "5. Deploying...."
#           system("#{base_dir}deploy.sh #{ARGV[0]}")

#         else
#           system("echo \"#{Time.now.strftime("%y%m%d_%H%M%S")}\" >> #{base_dir}#{project_name}-#{ARGV[0]}_NO.log")
#         end
#       else
#         system("echo \"#{Time.now.strftime("%y%m%d_%H%M%S")}\" >> #{base_dir}#{project_name}-#{ARGV[0]}_NO.log")
#       end
#     else
#       system("echo \"#{Time.now.strftime("%y%m%d_%H%M%S")}\" >> #{base_dir}#{project_name}-#{ARGV[0]}_NO.log")
#     end

#   end

# end
# puts "\n------------------------------------------------------------------------------ "  
