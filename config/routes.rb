
Rails.application.routes.draw do
  root 'companies#index'
  resources :companies
  post 'companies/status', to: 'companies#updateStatus', as: 'update_status';
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login' , to: 'login#index';
  delete 'logout', to: 'login#destroy', as: 'logout';
  post 'postLogin' , to: 'login#postLogin';
end
