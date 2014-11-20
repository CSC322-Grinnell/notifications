HeadStart::Application.routes.draw do
  resources :students

resources :text
root :to => redirect('/text')

end
