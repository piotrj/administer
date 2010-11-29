Rails.application.routes.draw do |map|
  resources :administer, :controller => 'administer/dashboard'
end
