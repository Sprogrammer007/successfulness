Rails.application.routes.draw do

 
  devise_for( :users,
              :skip => [:registrations], 
              :controllers  => { :registrations => "registrations", :sessions => "sessions" },
              :path => '/'
            )
  devise_for :teachers, skip: :sessions
  devise_for :students, skip: :sessions
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :users, path: '/', except: [:index] 

  root to: 'static_pages#home'
  match '/browse', to: 'static_pages#browse', via: 'get'
end
