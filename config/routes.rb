Capsuleer::Application.routes.draw do
  authenticated :user do
    root :to => 'home#dashboard'
  end

  devise_for :users , :skip => [:sessions] 
  as :user do
    get "/login" => "devise/sessions#new", :as => :new_user_session
    post '/signin' => 'devise/sessions#create', :as => :user_session
    delete "/logout" => "devise/sessions#destroy", :as => :destroy_user_session
    root :to => "devise/sessions#new"
  end
  
  resources :users, :only => [:index, :show, :edit]
  resources :home
end