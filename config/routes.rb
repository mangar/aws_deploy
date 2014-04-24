Rails.application.routes.draw do  
  if Rails.env == "development" || Rails.env == "development_remote"
  	#TODO refactor with metaprogramming
  	if Rails.application.config.action_controller.relative_url_root.blank?
	    namespace :aws_deploy do 
	      root :to => 'index#index', :as => :root_awsdeploy
	      match "/send_to_production"  => "index#send_to_production", :as => :send_to_production_awsdeploy, via: [:post]
	      match "/version"  => "index#version", :as => :version, via: [:get]

<<<<<<< HEAD
        get "/notifications"  => "notifications#index", :as => :notifications
        post "/notifications/send"  => "notifications#sendn", :as => :notifications_send
	    end
	  else
	  	scope Rails.application.config.action_controller.relative_url_root do
		  	namespace :aws_deploy do 
		      root :to => 'index#index', :as => :root_awsdeploy
		      match "/send_to_production"  => "index#send_to_production", :as => :send_to_production_awsdeploy, via: [:post]
          match "/version"  => "index#version", :as => :version, via: [:get]

          get "/notifications"  => "notifications#index", :as => :notifications
          post "/notifications/send"  => "notifications#sendn", :as => :notifications_send
        end
      end
=======
      match "/version"  => "index#version", :as => :version, via: [:get]

      get "/notifications"  => "notifications#index", :as => :notifications
      post "/notifications/send"  => "notifications#sendn", :as => :notifications_send
>>>>>>> d713a991a68fb5b9c0f103fd466c3665a6dbaf2a
    end
  end
end
