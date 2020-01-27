# frozen_string_literal: true

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  post "/graphql", to: "graphql#execute"
  mount ShopifyApp::Engine, at: "/"
  root to: "products#index"
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
