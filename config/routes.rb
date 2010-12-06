Rails.application.routes.draw do |map|
  namespace :administer do
    resources :dashboard
  end
  
  math '/administer', to => 'administer#dashboard'
end
