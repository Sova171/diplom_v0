Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root 'students#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users do
    resources :achievements
  end

  resources :achievements do
    resources :likes
  end
  #get "/teachers", to: "teachers#index"

  get "/myprofile", to: "current_user#index"

  get "/search", to: "students#search"
  get "/search_teachers", to: "teachers#search_teachers"

  resources :teachers
  resources :students
  resources :timespans
end
