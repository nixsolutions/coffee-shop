# frozen_string_literal: true

Rails.application.routes.draw do
  root :to => 'home#index'
  post "/graphql", to: "graphql#execute"
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" if Rails.env.development?
  mount ShopifyApp::Engine, at: "/"
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
