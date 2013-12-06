module AwsDeploy::Tasks::GenerateGitVersionTagRb

  # 
  # 
  def generate_local_git_version_tag_rb
    
    content = 
        "class GitVersionTag \n" + 
        " \n" + 
        " \n" + 
        "  def initialize time=\"sample time\", remote_git=\"gitlab\", public_dir=\"../public\" \n" + 
        "    @time = time \n" + 
        "    @remote_git = remote_git \n" + 
        "    @public_dir = public_dir \n" + 
        "  end \n" + 
        " \n" + 
        "  #  \n" + 
        "  #  \n" + 
        "  #  \n" + 
        "  def version_it \n" + 
        "    version_content = \"Deployment Version: \#{@time}\" \n" + 
        " \n" + 
        "    File.open(\"\#{@public_dir}/version.txt\", 'w') {|f| f.write(version_content) } \n" + 
        "    system(\"git branch >> \#{@public_dir}/version.txt\") \n" + 
        "    system(\"git add .\") \n" + 
        "    system(\"git commit -am 'updating version.txt' \") \n" + 
        " \n" + 
        "    current_branch = %x[git rev-parse --abbrev-ref HEAD].gsub(\"\\n\", \"\").gsub(\"/\",\".\") \n" + 
        "    system(\"git push \#{@remote_git} \#{current_branch}\") \n" + 
        "  end \n" + 
        " \n" + 
        " \n" + 
        "  #  \n" + 
        "  #  \n" + 
        "  #  \n" + 
        "  def tag_it \n" + 
        " \n" + 
        "    current_branch = %x[git rev-parse --abbrev-ref HEAD].gsub(\"\\n\", \"\").gsub(\"/\",\".\") \n" + 
        "    tag_name = \"v.\#{@time}.\#{current_branch}\"   \n" + 
        " \n" + 
        "    puts \"  - Tag name: \#{tag_name}\" \n" + 
        "    puts \"  - Current Branch: \#{current_branch}\" \n" + 
        " \n" + 
        "    system(\"git add .\") \n" + 
        "    system(\"git commit -am \\\"deploy from \#{current_branch}\\\"\") \n" + 
        "    system(\"git push \#{@remote_git} \#{current_branch}\") \n" + 
        " \n" + 
        "    system(\"git tag -a \#{tag_name} -m \\\"tag :: deploy from branch: \#{current_branch}\\\"\") \n" + 
        "    system(\"git push \#{@remote_git} \#{tag_name}\") \n" + 
        " \n" + 
        "  end \n" + 
        " \n" + 
        " \n" + 
        " \n" + 
        "end \n"

    File.delete("#{Rails.root}/script/lib/deploy/git_version_tag.rb") if File.exists?("#{Rails.root}/script/lib/deploy/git_version_tag.rb")

    File.open("#{Rails.root}/script/lib/deploy/git_version_tag.rb", "w") do |f| 
      f.write("#{content}")
    end

    "#{Rails.root}/script/lib/deploy/git_version_tag.rb"
  end


end



