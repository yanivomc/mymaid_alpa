MyMaidAlpa::Application.routes.draw do

  get "search/results"

  resources :users do
    member do
      get :hired # this will give us the url : /professional/#/hired_by
    end
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :professional do
    member do
      get :hired_by # this will give us the url : /professional/#/hired_by
    end
  end

  resources :search
  resources :users_pro_shares , only: [:create, :destroy]



  root                                    to: 'static_pages#home'
  match '/help',                          to: 'static_pages#help'
  match '/our_services',                  to: 'static_pages#our_services'
  match '/about_us',                      to: 'static_pages#about_us'
  match '/signup',                        to: 'users#new'
  match '/signin',                        to: 'sessions#new'
  match '/signout',                       to: 'sessions#destroy', via: :delete     # Using the Via :delete - is basically saying to allow/use DELETE http request
  match '/public_profile',                to: 'users#profile-public'

  # Professionals Routes
  match '/signup_professional',           to: 'professional#new'
  match '/signin_professional',           to: 'sessions#new_professional'
  match '/signout_professional',          to: 'sessions#destroy_professional', via: :delete     # Using the Via :delete - is basically saying to allow/use DELETE http request
  match '/public_professional',           to: 'professional#profile-public'
  #match '/professional/:id',              to: 'professional#show'
  match '/professional',                  to: 'professional#create'
  #match '/professional/search/',    to: 'professional#search_results', via: :post, as: :search_results
  match '/search/results',                to: 'search#results'
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
  # match ':controller(/:action(/:id))(.:format)'
end
