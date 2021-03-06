Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :account_activation, only: [:edit]

  root      'static_pages#home'
  controller :static_pages do 
    get     'home'       => :home
    get     'help'       => :help
    get     'about'      => :about
    get     'contact'    => :contact
    get     'error404'   => :error404
  end

  resources :users
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

  Rails.application.routes.default_url_options[:host] = 'localhost:3000'