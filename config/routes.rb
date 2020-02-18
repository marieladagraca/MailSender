Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'

  Rails.application.routes.draw do
    mount Sidekiq::Web => '/sidekiq'
  end
  
  post 'email', to: 'messages#create'
end
