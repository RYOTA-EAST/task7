Rails.application.routes.draw do
  root "todos#index"
  resources :todos, only: %i(index show new create)
end
