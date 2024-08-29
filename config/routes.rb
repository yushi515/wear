Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] 

  get 'posts/date' => 'posts#date'
  get 'posts/travel' => 'posts#travel'
  get 'posts/cafe' => 'posts#cafe'
  get 'posts/top' => 'posts#top'
  get 'posts/images' => 'posts#images'

  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  
  get 'lectures/index'
  get 'lectures/new'

 
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'posts#index'
   
    end
    
