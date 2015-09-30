Rails.application.routes.draw do

  get '/posts', to: "posts#index", as: "posts"

  get '/posts/new', to: "posts#new", as: "new_post"

  get '/posts/:id', to: 'posts#show', as: "post"

  get '/posts/:id/edit', to: 'posts#edit', as: "edit_post"

  post "/posts", to: "posts#create"
  #the update route 
  patch "/posts/:id", to: "posts#update"

  #the destroy route 
  delete "/posts/:id", to: "posts#destroy"

  get '/cities', to: "cities#index"

  get '/cities/:id', to: "cities#show", :as => :city_name

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


  get 'users/posts/:id' => 'users#posts', as: "user_posts"


 
end