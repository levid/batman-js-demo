BatmanRailsDemo::Application.routes.draw do

  resources :posts do
    resources :comments
  end
  #resources :comments
  root to: 'main#index'

end
