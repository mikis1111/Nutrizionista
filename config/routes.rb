Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "chi_sono", to: "pages#chi_sono"
end
