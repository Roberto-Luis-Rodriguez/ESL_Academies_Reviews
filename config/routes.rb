Rails.application.routes.draw do
  root to: "esl_academies_reviews#index"

  devise_for :users
  # root to: "esl_academies_reviews#index"
end
