Rails.application.routes.draw do
  namespace :administer do
    resources :dashboard
    resources :entities
  end

  match 'administer', :to => 'administer/dashboard#index'
end
