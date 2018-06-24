Rails.application.routes.draw do
  root to: "top#index"

  get 'top/index'
  resources :todos

  # api
  get 'api/todos/index' => 'api/todos#index'
  get 'api/todos/show/:todo_id' => 'api/todos#show'
  put 'api/todos/update/:todo_id' => 'api/todos#update'
  post 'api/todos/create' => 'api/todos#create'

  # header
  get '/about',   to: 'top#index'
  get '/contact', to: 'top#index'
end
