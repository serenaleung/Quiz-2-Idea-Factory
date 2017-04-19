Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get('/ideas', {to: 'ideas#index'})
  post('/ideas', {to: 'ideas#create', as: 'ideas_submit'})


  # resources :ideas do
  #   resources :comments, only: [:create, :destroy]
  # end

  # resources :ideas, only: [:new, :show]
  resources :ideas do
    resources :reviews, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]
  # prevents password to show in address bar
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  root 'ideas#index'

end
