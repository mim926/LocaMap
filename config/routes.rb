Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
        registrations: 'users/registrations'
      }
  get "home/index"
  get "posts/index"
  root "home#index"
end
