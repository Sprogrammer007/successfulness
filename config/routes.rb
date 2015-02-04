Rails.application.routes.draw do


  resources :users, path: '/', except: [:index] do
    member do
      get 'settings'
      post 'update_settings'
    end
  end

  root to: 'static_pages#home'
end
