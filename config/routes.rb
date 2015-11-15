Rails.application.routes.draw do

devise_for :users

get "/users/dashboard" => "users#dashboard"
get "/users/address" => "users#address"

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
