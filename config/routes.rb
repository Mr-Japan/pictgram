Rails.application.routes.draw do
 
 resources :users
 get 'users/new'
 get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
 root 'pages#index'
 get 'pages/help'
 
 
 get     '/login',  to: 'sessions#new'
 post    '/login',  to: 'sessions#create'
 delete  '/logout', to: 'sessions#destroy'
 
 resources :topics
 get 'topics/new'
 
 get 'favorites/index', to: 'favorites#index'
 post '/favorites',     to: 'favorites#create'
 
 get '/admin',                to: 'admin#index',          as:"admin_index"
 #post 'admin/sign_in',        to: 'admin#sign_in'      as:"admin_sign_in"
 #delete 'admin/sign_out'       to: 'admin#sign_out'     as:"admin_sign_out"   
 
end