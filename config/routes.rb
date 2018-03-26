Rails.application.routes.draw do
  get 'esl_academies_reviews/home'

  devise_for :users
  root to: "esl_academies_reviews#index"
  # root to: "home#index"
end
