Rails.application.routes.draw do
  root 'posts#index'
  resources :subdevvits
  resources :posts
end
