Rails.application.routes.draw do
  # get 'messages/index'
  # get 'messages/new'
  # get 'messages/create'
  # get 'messages/edit'
  # get 'messages/update'
  # get 'messages/destroy'
  resources :messages
  root to: "messages#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
