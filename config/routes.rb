Rails.application.routes.draw do
  devise_for :pilots

  root 'site/home#index'

  namespace :dov do
    get 'dashboard', to: 'dashboard#index'
  end

  get 'fsacars/connect_client', to: 'fsacars#connect_client'
end
