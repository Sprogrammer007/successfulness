Rails.application.routes.draw do

  devise_for( :users, 
              :controllers  => { :registrations => "registrations", :sessions => "sessions" }, 
              :path => "/users"
            )
  resources :users


  root to: 'static_pages#home'
  match '/browse', to: 'static_pages#browse', via: 'get'
end
