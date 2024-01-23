Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    resources :products
    post '/login', to: 'auth#authenticate'
    post '/users', to: 'users#create'
  end
end
