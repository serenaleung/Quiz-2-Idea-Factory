Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  # resources :ideas do
  #   resources :comments, only: [:create, :destroy]
  # end

  resources :ideas, only: [:create, :show]

  root 'ideas#index'

end
