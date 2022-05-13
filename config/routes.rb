Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root 'students#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  #get "/teachers", to: "teachers#index"

  get "/myprofile", to: "current_user#index"
  resources :teachers
  resources :students
  resources :timespans
end
