Rails.application.routes.draw do
  devise_for :users
  # get 'messages/index'
  # get 'messages/new'
  # get 'messages/create'
  # get 'messages/edit'
  # get 'messages/update'
  # get 'messages/destroy'
  # resources :messages
  resources :messages do
    resource :likes, only: [:create, :destroy]
  end
  root to: "messages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
