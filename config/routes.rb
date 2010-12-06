Rails.application.routes.draw do |map|
  namespace :administer do
    resources :dashboard
    resources :model
  end
  
  match 'administer', :to => 'administer/dashboard#index'
end
