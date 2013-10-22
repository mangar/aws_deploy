class Deploy::Deploy

  def initialize
    
  end

  def deploy_on_stage

    # generate packaging
    Deploy::Packing.new.run_all
    
    
    
  end


end