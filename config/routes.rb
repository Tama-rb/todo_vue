Rails.application.routes.draw do
  get 'top/index'
  resources :todos

  namespace :api, format: 'json' do
    resources :todos, only: [:index, :create, :update]
  end
end
