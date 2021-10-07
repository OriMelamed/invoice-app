Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :buyers, shallow: true do
    resources :invoices
  end
end

