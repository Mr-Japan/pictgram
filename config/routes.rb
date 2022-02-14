Rails.application.routes.draw do
 
 resources :users
 resources :topics
 
 get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
 root 'pages#index'
 get 'pages/help'
 
 
 get     '/login',      to: 'sessions#new'
 post    '/login',      to: 'sessions#create'
 delete  '/logout',     to: 'sessions#destroy'
 
 #get 'topics/new'
 
 get 'favorites/index',  to: 'favorites#index'
 post '/favorites',      to: 'favorites#create'
 
 #resources :admin 
 get    '/admin',        to: 'admin#index'
 delete '/admin/users/:id',    to: 'admin#destroy_user',          as: "destroy_user"
 delete '/admin/topics/:id',    to: 'admin#destroy_topic',         as: "destroy_topic"
 # post 'admin/',        to: 'admin#sign_in'      as:"admin_sign_in"
 #delete 'admin/sign_out'       to: 'admin#sign_out'     as:"admin_sign_out"   
 
end