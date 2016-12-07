HeadStart::Application.routes.draw do
  resources :classrooms
  resources :history
  resources :students
  resources :contacts
  resources :text
  resources :user_sessions
  resources :users, :as => 'users'  # give us our some normal resource routes for users
  resources :user, :as => 'account'  # a convenience route
  resources :user_manual

  root :to => 'user_sessions#new'

  match 'login' => 'user_sessions#new',      :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match 'msg-history' => 'history#index', :as => :history
  match 'signup' => 'users#new', :as => :signup
  match 'newcontact' => 'contacts#new', :as => :newcontact
  match 'txtmsg' => 'message#txtmsg', :as => :txtmsg
  match 'settings' => 'users#new', :as => :settings

end
