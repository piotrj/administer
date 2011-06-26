Rails.application.routes.draw do
  namespace :administer do
    resources :dashboard, :only => :index
    resources :entities
  end

  match 'administer', :to => 'administer/dashboard#index'
end
