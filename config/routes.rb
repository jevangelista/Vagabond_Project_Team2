Rails.application.routes.draw do

  root to: 'welcome#index' #same as get "/" => "articles#index"
  
  get "/users", to: "users#index", as: "users"

  get "/users/new", to: "users#new", as: "new_user"

  post "/users", to: "users#create"

  get "/users/:id", to: "users#show", as: "user"

  #sessions routes

  get "/sign_in", to: "sessions#new"  

  post "/sessions", to: "sessions#create"

  delete "/sessions", to: "sessions#destroy", as: "logout"

  #update routes

  get "/users/:id/edit", to: "users#edit", as: "edit_user"

  # The update route
  patch "/users/:id", to: "users#update" 

  

 
end
