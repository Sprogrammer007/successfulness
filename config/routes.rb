Rails.application.routes.draw do

  root  'static_pages#home'

  devise_for( :users, 
              :controllers  => { :registrations => "registrations", :sessions => "sessions" }, 
              :path => ""
            )

  resources :user
  
  devise_scope :user do  
    get 'profile/:id',        to: 'users#show',          as: :user_profile
  end
end
