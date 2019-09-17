Rails.application.routes.draw do
  devise_for :users
   # get '/todo_lists' => 'todo_lists#index'
  resources :todo_lists, only: [:index, :new, :create, :edit, :update, :show]
  root "todo_lists#index"
 
end
