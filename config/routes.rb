Rails.application.routes.draw do

  root to: 'bukkens#index'

  resources :bukkens
end
