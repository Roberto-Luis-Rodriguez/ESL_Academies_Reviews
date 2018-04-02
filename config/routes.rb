Rails.application.routes.draw do

  root to: "esl_academies_reviews#index"

  devise_for :users

end
