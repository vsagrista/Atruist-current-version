Rails.application.routes.draw do
devise_for :users

get "/users/dashboard" => "users#dashboard"
root :to => "users#redirect_to_dashboard"
#root to: "users#dashboard" 
scope "/" do
  resources :users
end

# routes.rb

 

#root to:  "users#dashboard"
 
end
