Rails.application.routes.draw do

devise_for :users

get "/users/dashboard" => "users#dashboard"
get "/users/address" => "users#address"
get "/users/search" => "talents#search"

namespace :api  do
  namespace :v1 do
  	get "/addresses" => "base#addresses"
  	get "/addresses/cities" => "base#cities"
    resources :base, only: [:index, :show]
  end
end

authenticated :user do
  root :to => "users#redirect_to_dashboard", as: :authenticated_root
end

root :to => "welcome#welcome"

scope "/" do
  resources :users
  resources :users do
  	resources :talents
  end
end


 
end
