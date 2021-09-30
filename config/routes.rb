Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :invoices, only: [:show, :index, :new, :create]
end
