Rails.application.routes.draw do
  get 'top/index'
  resources :todos

  # api
  get 'api/todos/index' => 'api/todos#index'
  get 'api/todos/show/:todo_id' => 'api/todos#show'
  post 'api/todos/update/:todo_id' => 'api/todos#update'

  # header
  get '/about',   to: 'home#index'
  get '/contact', to: 'home#index'
end
