COOPCondos::Application.routes.draw do

  devise_for :users
	namespace :admin do

		resources :articles
		resources :video_section
		resources :private_videos
		resources :private_sites, except: :index do
			member do
				get :send_email
			end
		end
		resources :galleries do
			collection do
				post :set_public
				post :set_neighborhood
			end
			member do
				post :sort
				post :add_image
			end
		end
		resources :floor_plans do
			member do
				get :download
			end
		end

	end

	delete  "/admin/galleries/remove_image/:gallery_image_id" => 'admin/galleries#remove_image', as: :remove_image_admin_gallery

	authenticated :user do
		get "admin/content", to: "admin/admin#content", as: :admin_content
		get "admin/availability", to: "admin/admin#availability", as: :admin_availability
		get "admin/private_sites", to: "admin/admin#private_sites", as: :admin_private_sites_dashboard
		get "admin", to: "admin/admin#index", as: :admin_dashboard
		get "admin/user_export", to: "admin/admin#export_public_users", as: :user_export
	end

	root to: "public#index"
	get "private/floor_plans/:id", to: "admin/floor_plans#download" , as: :private_floor_download
	post "public_user", to: "public#create", as: :public_users
	get "floor_plans", to: "public#floor_plans", as: :floor_plans_export
	get "private/:uniq_id", to: "private#show", as: :private_site
	get "gallery", 	to: "public#index"
	get "home", 	to: "public#index"
	get "design-team", 	to: "public#index"
	get "developers", 	to: "public#index"
	get "availability", 	to: "public#index"
	get "developers", 	to: "public#index"
	get "contact", 	to: "public#index"
	get "legal", 	to: "public#index"
	get "design-team/:id", to:"public#index"
	get "developers/:id", to:"public#index"




end
