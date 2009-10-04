ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "home", :action => "show"

  # See how all your routes lay out with "rake routes"
  map.resources :rounds
  
  map.profile 'profile/:user', :controller => 'users', :action => 'edit'
  map.history 'history/:user', :controller => 'rounds', :action => 'index'
  map.golfer 'golfer/:user', :controller => 'users', :action => 'show'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.signin '/signin', :controller => 'sessions', :action => 'new'
  map.signout '/signout', :controller => 'sessions', :action => 'destroy'
  
  map.resources :users, :controller => 'users' do |users|
    users.resource :password, :controller => 'passwords', :only => [:create, :edit, :update]
    users.resource :confirmation, :controller => 'confirmations', :only => [:new, :create]
  end
  
  map.resources :passwords, :controller => 'passwords', :only => [:new, :create]
  map.resource  :session, :controller => 'sessions', :only => [:new, :create, :destroy]
  
  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
