Rails.application.routes.draw do

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
    get 'destroy_user/:id', 
      action: :destroy, 
      as: :destroy_user

  end
  
  controller :sessions do
    get     'login'      => :new  
    post    'login'      => :create
    get     'logout'     => :destroy
  end

  # resources :account_activation, only: [:edit]
  resources :posts, only: [:create, :destroy]

end

Rails.application.routes.default_url_options[:host] = 'localhost:3000'
