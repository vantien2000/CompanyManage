
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' , to: 'home#index';
  get 'login' , to: 'login#index';
  get 'logout', to: 'login#destroy';
  post 'login' , to: 'login#postLogin';
end
