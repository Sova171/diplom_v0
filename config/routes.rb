Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root 'students#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :timespans
end
