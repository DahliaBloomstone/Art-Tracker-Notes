Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#home'

#RESTFUL ROUTES:
#Using RESTFUL conventions using CRUD system 
#Includes: the HTTP verb (ex: get) 
#The path: the path in the URL bar the route will be mapped to (ex: /signup’) 
#The controller action: tells the Rails routing system that this route should be passed through the static controllers action. (ex: ‘users#new’)
#The controller action either performs a task, such as creating, updating, or deleting a record in the database, or it runs a database query and renders a view to the client.

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#fbcreate'

  #RESOURCES:
  #Objects that you want the user to access via the URL
  #Perform CRUD operations on
  #database table, represented by a model, acted on through a controller
  resources :users
  resources :art_plans
  resources :art_projects, only: [:edit, :index, :show ]
  resources :art_schedules

  resources :art_plans do
    resources :art_schedules, only: [:new, :index, :create]
  end

  resources :art_projects do
    resources :art_schedules, only: [:new, :index, :create]
  end
end

#get: render erb content, retreives info
#post: url in the form action, server creates new resource
#delete: deletes the thing/destroys, server delete resource