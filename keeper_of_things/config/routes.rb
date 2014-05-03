Rails.application.routes.draw do
  devise_for :users
  use_doorkeeper

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get '/me' => "credentials#me"

      resources :items, only: [:index]
    end
  end

  get 'home/index'
  root 'home#index'
end
