Rails.application.routes.draw do
  
  resources :student, :controller => "registrations", :type => "Student", only: [:new, :create]
  resources :teacher, :controller => "registrations", :type => "Teacher",  only: [:new, :create]

  resources :users, path: '/', except: [:index, :new, :create, :destroy] do
    member do
      get 'settings'
      post 'update_settings'
    end
  end

  scope constraints: lambda { |r| r.env['warden'].user.nil? } do
    get "signup", to: "users#new", as: "signup"
    get "login", to: "sessions#new", as: "login"
  end

  match 'logout', to: 'sessions#destroy', via: [:delete], as: "logout"
  
  root to: 'static_pages#home'
end
