Rails.application.routes.draw do
  
  resources :student, path_names: {:new => 'sign_up'}, :controller => "registrations", :type => "Student", only: [:new, :create]
  resources :teacher, :controller => "registrations", :type => "Teacher",  only: [:new, :create]

  scope constraints: lambda { |r| r.env['warden'].user.nil? } do
    match "/login", to: "sessions#new", via: :get, as: "login"
  end

  match '/logout', to: 'sessions#destroy', via: [:delete], as: "logout"
  
  resources :sessions, only: [:create]

  resources :users, path: '/', except: [:index, :new, :create, :destroy] do
    member do
      get 'settings'
      post 'update_settings'
    end
  end

  root to: 'static_pages#home'
end
