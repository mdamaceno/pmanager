Rails.application.routes.draw do
  root to: 'welcome#index'

  scope module: 'authentication' do
    get '/signup' => 'users#new'
    post '/users' => 'users#create'
  end
end
