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

  resource :promise_filter, :controller => :promise_filter, :only => [:create]

  match "/estados/:estado/provincias", :to => "provincias#index"

  match "/representantes/:lugar", :to => "representantes#show"

  match "/facebook", :to => "home#facebook"
  match "/oauth", :to => "home#oauth"

  match "/promesas/:search/:query", :to => "promesas#index", :as => "promesas_filters"

  match "promesas/hito/:milestone_id/comentario", :to => "comments#create", :as => "hito_comentario"
  match "promesas/:slug", :to => "promesas#show", :as => "promesa"

  match "directorio", :to => "regiones#index", :as => "directorio"
  match "contacto/new", :to => "contacto#new", :as => "new_contacto"
  match "contacto", :to => "contacto#create", :as => "contacto", :via => :post
  match "regiones/:region_name", :to => "regiones#show", :as => "region"

end
