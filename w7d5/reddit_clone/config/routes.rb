Rails.application.routes.draw do

  get 'posts/show'
  get 'posts/new'
  get 'posts/create'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resource :session

  resources :subs, except: [:destroy]
end
