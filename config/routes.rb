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
   
   get "usa_visa" => 'products#usa_visa'
   get "products/download_turist_doc"
   get "products/download_student_doc"
   get "products/download_work_doc"
   
   get "uk_visa" => 'products#uk_visa'
   get "products/download_turist_uk_doc"
   get "products/download_student_uk_doc"
   get "products/download_biznes_uk_doc"
   
   post 'visas/search' => 'visas#search', as: :search
   
   post 'start_search' => 'visas#start_search', as: :start_search
   
	get "migration_to_usa" => 'pages#migration', as: :migration
	
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
