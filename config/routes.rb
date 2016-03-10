HeadStart::Application.routes.draw do
  resources :classrooms
  resources :history
  resources :students
  resources :text
  resources :user_sessions

  match 'login' => 'user_sessions#new',      :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  resources :users  # give us our some normal resource routes for users
  resource :user, :as => 'account'  # a convenience route

  match 'signup' => 'users#new', :as => :signup

  root :to => 'user_sessions#new'

end
