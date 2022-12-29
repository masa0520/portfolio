Rails.application.routes.draw do
  resources :posts do 
    resources :reviews, only: [:edit, :update, :create, :destroy], shallow: :true
    resource :likes, only: %i[create destroy]
    collection do
      get 'likes'
    end
  end
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "top#index"
  resources :restaurants
end
