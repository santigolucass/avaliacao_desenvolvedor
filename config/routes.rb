AvaliacaoDesenvolvedorRails::Application.routes.draw do
  resources :purchases
  root 'purchases#index'
end
