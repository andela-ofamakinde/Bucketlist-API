Rails.application.routes.draw do

  namespace :api do  
    namespace :v1 do  
      resources :users  
      post 'bucketlists/:bucketlist_id' => 'bucketlist_items#create'
      resources :bucketlists  
      post 'login' => 'login#create'
      get 'logout' => 'login#logout'
      get 'list' => 'bucketlist#lists'
    end  
  end 

end
