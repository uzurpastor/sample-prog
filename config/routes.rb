Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
   
  root      'static_pages#home'
  

  resources :users

  resources :account_activation, only: [:edit]

  controller :static_pages do 
    get     'home'       => :home
    get     'help'       => :help
    get     'about'      => :about
    get     'contact'    => :contact
    get     'error404'   => :error404
  end

  controller :users do 
    get     'sign'       => :new  
    get     'show'       => :show  
    get     'index'      => :index
  end
  
  controller :sessions do
    get     'login'      => :new  
    post    'login'      => :create
    get     'logout'     => :destroy
  end
end
