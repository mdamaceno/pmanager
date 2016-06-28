Rails.application.routes.draw do
  root to: 'welcome#index'

  mount Damauth::Engine, at: "/auth"
end
