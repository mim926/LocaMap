Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  get "posts/index"
  root "home#index"
end
