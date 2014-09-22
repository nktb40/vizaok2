require 'sidekiq/web'
GShockShop::Application.routes.draw do
  get "questions/index"
  get "questions/create"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index'
  
  #sidekiq web interface
  mount Sidekiq::Web, at: "/sidekiq"
  
  
  # root 'orders#index
   resources :orders , only: [:index, :new, :create] do
   	collection do
   		match 'add_product', via: :all
   		match 'show_cart', via: :all
   	end
   	
   end 
   resources :products , only: [:index]
   resources :questions , only: [:create]
   resources :countries, only: [:index, :show]
   resources :visas, only: [:index, :show]
   
   get "products/download_turist_doc"
   get "products/download_student_doc"
   get "products/download_work_doc"
   
   get "products/download_turist_uk_doc"
   get "products/download_student_uk_doc"
   get "products/download_biznes_uk_doc"
   
   post 'visas/search' => 'visas#search', as: :search
   
   post 'poisk-vizy' => 'visas#start_search', as: :start_search
   
	get "immigratsiya-v-ssha" => 'pages#usa_migration', as: :usa_migration
	
	get "immigratsiya-v-avstraliyu" => 'pages#au_migration', as: :au_migration
	
	get "immigratsiya-v-kanadu" => 'pages#ca_migration', as: :ca_migration
	
	post "visas_by_country" => "visas#visas_by_country", as: :visas_by_country
	
	#get "vizy-v-ssha" => "visas#get_usa_visas", as: :usa_visas 	
	#get "vizy-v-kanadu" => "visas#get_ca_visas", as: :ca_visas 
	#get "vizy-v-avstraliyu" => "visas#get_au_visas", as: :au_visas 
   #get "vizy-v-velikobritaniyu" => "visas#get_uk_visas", as: :uk_visas 
   

   resources :catalogs do
       resources :visas
   end
	
  # Example of regular route:
  #  get 'd917148ce012' => 'products#d917148ce012'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
