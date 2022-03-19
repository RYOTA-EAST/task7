Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/signup', to: 'registrations#new'
  post '/signup', to: 'registrations#create'

  root 'todos#index'
  resources :todos
end
