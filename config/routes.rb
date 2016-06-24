Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
