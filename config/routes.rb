
Rails.application.routes.draw do
  resources :companies
  post 'companies/status/', to: 'companies#updateStatus'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login' , to: 'login#index';
  delete 'logout', to: 'login#destroy', as: 'logout';
  post 'postLogin' , to: 'login#postLogin';
end
