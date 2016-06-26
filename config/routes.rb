Rails.application.routes.draw do
  root to: 'site/home#index'

  scope module: 'site' do
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
    get '/signup' => 'users#new'
    post '/users' => 'users#create'
  end
end
