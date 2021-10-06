Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :buyers do
    resources :invoices
  end
end

