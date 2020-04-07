Rails.application.routes.draw do
  resources :products, only: :index
  post 'products/search', to: 'products#simple_search'
end
