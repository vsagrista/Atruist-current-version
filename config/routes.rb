Rails.application.routes.draw do

devise_for :users

get "/users/dashboard" => "users#dashboard"
get "/users/address" => "users#address"
get "/users/talentsearch" => "talents#search"

namespace :api  do
  namespace :v1 do
  	get "/talents" => "base#index"
  	get "/cities" => "base#cities"
    get "/cities/:city/talents" => "base#get_users_with_talents_in_city"
    get "/cities/:city/talents/:talent" => "base#get_top_rated_talents_for_city"
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
