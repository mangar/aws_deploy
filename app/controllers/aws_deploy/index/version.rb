module AwsDeploy::Index::Version

	# 
	# 
	def version
	   render :json => {:data => "#{_get_version_file}" } 
	end


	private	

    # 
    # 
    def _get_version_file
        version = "version.txt not found"
        if File.exists?("./public/version.txt")
            File.open('./public/version.txt') {|f| version = f.readline}
        end
        version
	end



end