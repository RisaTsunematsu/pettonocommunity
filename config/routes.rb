Rails.application.routes.draw do
  
devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

#会員側
 scope module: :public do
   root to: 'homes#top'
   get '/about' => 'homes#about'
   #get '/search', to: 'searches#search'
   resources :users do
     get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
     patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
   end
   
   
   resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
   end
 end

 
devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
#管理者側
 namespace :admin do
   root 'homes#top'
   resources :users
   resources :posts
   resources :post_comments
 end
  





end
