Rails.application.routes.draw do
  get "home/index"
  get "posts/index"
  root "home#index"
end
