Rails.application.routes.draw do
  # get 'posts/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  # post 'posts' => 'posts#create'
  resources :posts
end
