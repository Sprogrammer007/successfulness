Rails.application.routes.draw do

  devise_for( :users, 
              :controllers  => { :registrations => "registrations", :sessions => "sessions" }, 
              :path => "/users"
            )
  resources :users


  root to: 'application#index'

  match '/auth_user', to: 'application#authenticate_user', via: 'get'
end
