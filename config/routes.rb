Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  get "home/index"

  resources :posts, only: %i[index new create show edit update destroy] do
    resource :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy], shallow: true
    collection do
      get :autocomplete
    end
  end

  resources :users, only: %i[show]
  resource :mypage, only: %i[show edit update], controller: "users"
end
