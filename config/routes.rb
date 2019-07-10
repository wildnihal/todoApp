Rails.application.routes.draw do
   get '/todo_lists' => 'todo_lists#index'
   root "todo_lists#index"
end
