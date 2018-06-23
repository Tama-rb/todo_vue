Rails.application.routes.draw do
  get 'top/index'
  resources :todos

  get 'api/todos/index' => 'api/todos#index'
  get 'api/todos/show/:todo_id' => 'api/todos#show'
  post 'api/todos/update/:todo_id' => 'api/todos#update'
end
