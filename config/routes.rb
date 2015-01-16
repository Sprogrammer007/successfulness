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

  resources :users, path: '/', except: [:index] do
    member do
      get 'settings'
      post 'update_settings'
    end
  end

  root to: 'static_pages#home'
end
