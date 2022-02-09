Rails.application.routes.draw do
  resources :users

  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resources :albums, only: :new
  end

  resources :albums, except: :new

end
