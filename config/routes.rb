Rails.application.routes.draw do
  namespace :administer do
    resources :dashboard
    resources :models
  end
  
  match 'administer', :to => 'administer/dashboard#index'
end
