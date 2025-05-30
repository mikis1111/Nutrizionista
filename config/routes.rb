Rails.application.routes.draw do
  resources :contents
  devise_for :users
  root to: "pages#home"
  get "chi_sono", to: "pages#chi_sono"
end
