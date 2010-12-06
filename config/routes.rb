Rails.application.routes.draw do |map|
  namespace :administer do
    resources :dashboard
  end
  
  match 'administer', :to => 'administer/dashboard#index'
end
