Rails.application.routes.draw do
  root to: "pages#home"
  get "chi_sono", to: "pages#chi_sono"
end
