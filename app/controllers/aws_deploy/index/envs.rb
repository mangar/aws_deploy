module AwsDeploy::Index::Envs

	private	

    # 
    # 
    def _get_envs
      envs = []
      $aws_deploy["envs"].split(" ").each_with_index do |long_env,i|
        envs[i] = {long_env.split("|")[0] => long_env.split("|")[1]}
      end        
      envs
    end

    #
    #
    def _get_envs_code
      codes = []
      $aws_deploy["envs"].split(" ").each do |e| codes << "#{e.split("|")[0]}"   end
      codes
    end


end