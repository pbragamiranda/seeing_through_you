Rails.application.routes.draw do
  root to: 'pages#home'

  resources :stories, only: [ :index, :create ]
end
