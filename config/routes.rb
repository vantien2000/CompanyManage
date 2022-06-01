
Rails.application.routes.draw do
  resources :profiles
  resources :posts
  root 'companies#index'
  resources :companies do
    resources :profiles
  end
  post 'companies/status', to: 'companies#updateStatus', as: 'update_status';
  post 'profiles/status', to: 'profiles#updateStatus', as: 'update_status_profile';
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login' , to: 'login#index';
  delete 'logout', to: 'login#destroy', as: 'logout';
  post 'postLogin' , to: 'login#postLogin';
end
