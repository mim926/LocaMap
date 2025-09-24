Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  get "home/index"

  resources :posts, only: %i[index new create show edit update destroy] do
    resource :likes, only: %i[create destroy]
  end
end
