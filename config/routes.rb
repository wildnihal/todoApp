Rails.application.routes.draw do
  # get '/todo_lists' => 'todo_lists#index'
  root "todo_lists#index"
  devise_for :users
  resources :todo_lists do
    resources :todo_items
  end
end
