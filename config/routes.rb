Rails.application.routes.draw do
  get 'session/sign_in'
  post 'session/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"


end
