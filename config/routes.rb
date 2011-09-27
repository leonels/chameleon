Chameleon::Application.routes.draw do

  # get "dashboard/index"

  # resources :websites

  require 'subdomain'

  resources :accounts do
    resources :users
  end
  resources :users

  namespace :admin do |admin|
    match '/' => 'dashboard#index'
    resources :websites do
      resources :pages, :messages
    end

    resources :websites
    resources :pages
    resources :pages do
      resources :locations
    end
    resources :sessions
    resources :messages
    get 'login' => 'sessions#new', :as => 'login'
    get 'logout' => 'sessions#destroy', :as => 'logout'  
    resources :images
    resources :galleries
    resources :photos
    resources :galleries do
      resources :photos
    end
    resources :locations
    resources :forms
  end

  resources :pages do
    resources :locations, :galleries, :forms, :images
  end
  
  resources :password_resets
  resources :password_change
  get 'signup' => 'accounts#new', :as => 'signup'

  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post

  match '/(:permalink)' => 'pages#show'

  # constraints(Subdomain) do
  #   match '/' => 'websites#show'
  # end
  
  # match '/' => 'websites#show', :constraints => { :subdomain => /.+/ }
  root :to => 'pages#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
