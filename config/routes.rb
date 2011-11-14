Promesometro::Application.routes.draw do
  devise_for :admins, :controllers => { :sessions => "admin/sessions" }

  # The priority is based upon order of creation:
  # first created -> highest priority.

  namespace :admin do
    match 'officials/provinces/:state_id', :to => "officials#provinces", :as => 'official_provinces'
    resources :officials do
      resources :promises do
        resources :milestones
      end
    end
    resources :admins
    match "promises/milestones/:milestone_id/comment", :to => "comments#create", :as => "comment_milestone"
    match "promises/milestones/:milestone_id/comment/:id", :to => "comments#destroy", :as => "comment_milestone_destroy", :via =>:delete
    match "promises/milestones/:milestone_id/milestone_state", :to => "milestone_state#create", :as => "milestone_state", :via => :post
    match "promises/milestones/:milestone_id/milestone_state", :to => "milestone_state#update", :as => "milestone_state", :via => :put
    resources :comments do
      resource :comment_approval, :controller => :comment_approval, :only => [:create, :destroy]
    end
    resources :political_parties
    resources :topics, :except => [:show]
    match 'topics/sort', :to => "topics#sort", :as => 'sort_topics'
    root :to => "dashboard#index"
  end
  
  root :to => "home#show"

  resources :promesas, :only => [:index] do
    resource :comments, :only => :create
  end
  
  resources :acerca_de, :only => [:index]
  resources :temas, :only => [:index]
  
  match "/estados/:estado/provincias", :to => "provincias#index"
  
  match "/representantes/:lugar", :to => "representantes#show"
  
  match "/facebook", :to => "home#facebook"
  match "/oauth", :to => "home#oauth"
  
  match "promesas/hito/:milestone_id/comentario", :to => "comments#create", :as => "hito_comentario"
  match "promesas/:slug", :to => "promesas#show", :as => "promesa"
  
  match "directorio", :to => "regiones#index", :as => "directorio"
  match "contacto/new", :to => "contacto#new", :as => "new_contacto"
  match "contacto", :to => "contacto#create", :as => "contacto", :via => :post
  match "regiones/:region_name", :to => "regiones#show", :as => "region"
  
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
