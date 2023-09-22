Rails.application.routes.draw do

  # root path
  root "home_pages#show"

  # devise routes for users pointing to devise controllers
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :active_record_questions

end
