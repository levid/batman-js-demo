BatmanRailsDemo::Application.routes.draw do

  resources :posts do
    resources :comments
  end

  root to: 'main#index'

end
