Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root 'students#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get "/users/:id", to: "students#destroy_students"

  resources :users do
    resources :achievements
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :users do
    resources :posts
  end

  resources :achievements do
    resources :likes
  end

  resources :achievements do
    resources :comments
  end
  #get "/teachers", to: "teachers#index"

  get "/myprofile", to: "current_user#index"

  get "/search", to: "students#search"
  get "/search_teachers", to: "teachers#search_teachers"

  resources :teachers
  resources :students
  resources :timespans
  #resources :relationships, only: [:create, :destroy]
  get "/relationships/:id", to: "relationships#destroy"
  get "/relationships", to: "relationships#create"
end
