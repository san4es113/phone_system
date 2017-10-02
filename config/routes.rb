Rails.application.routes.draw do
  resources :passlosts
  devise_for :users

  root 'passlosts#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
