Abirds::Application.routes.draw do |map|
  root :to => "app#index"

  match "/signin" => "services#signin"
  match "/signout" => "services#signout"
  match "/logout" => "services#signout"

  match '/auth/:service/callback' => 'services#create' 
  match '/auth/failure' => 'services#failure'

  resources :services, :only => [:index, :create, :destroy] do
    collection do
      get 'signin'
      get 'signout'
      get 'signup'
      post 'newaccount'
      get 'failure'
    end
  end

  match "/auth/twitter/callback" => "authorize#create"
  match "/auth/failure" => "authorize#failure"
  match "/logout" => "authorize#destroy", :as => :logout
  match "/authorize" => redirect("/auth/google")
 
  resources :messages
  resources :channels
  resources :assets  
  resources :app
  
  match "/assets/*:id" => "assets#show"
     
  resources :room do
    collection do
      get 'send_data'
    end
  end

  # used for the demo application only
  resources :users, :only => [:index] do
    collection do
      get 'test2'
    end
  end
   
end