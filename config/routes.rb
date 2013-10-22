Rails.application.routes.draw do  
  namespace :aws_deploy do 
    root :to => 'index#index', :as => :root
    match "/send_to_production"  => "index#send_to_production", :as => :send_to_production, via: [:get]
  end
end