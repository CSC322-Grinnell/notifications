HeadStart::Application.routes.draw do
  resources :classrooms
  resources :history
  resources :students
  resources :contacts
  resources :text
  resources :user_sessions
  resources :users  # give us our some normal resource routes for users
  resources :user, :as => 'account'  # a convenience route

  root :to => 'user_sessions#new'

  match 'login' => 'user_sessions#new',      :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match 'msg-history' => 'history#index', :as => :history
  match 'signup' => 'users#new', :as => :signup
  match 'txtmsg' => 'message#txtmsg', :as => :txtmsg

end
