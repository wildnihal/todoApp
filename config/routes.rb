Rails.application.routes.draw do
   # get '/todo_lists' => 'todo_lists#index'
  resources :todo_lists, only: [:index, :new, :create, :edit, :update, :show]
  root "todo_lists#index"
  devise_for :users
  resources :users do
    resources :todo_lists
  end
end
