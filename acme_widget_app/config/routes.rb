Rails.application.routes.draw do
  resources :widgets

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  get 'home/index'

  get 'public/index'
  get 'public/not_signed_in'
  root 'public#index'
end
