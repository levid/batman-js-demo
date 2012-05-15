BatmanRailsDemo::Application.routes.draw do

  resources :posts, :shallow => true do
    resources :comments
  end

  root to: 'main#index'

end
