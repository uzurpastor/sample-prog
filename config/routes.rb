Rails.application.routes.draw do
  root      'static_pages#home'

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
  end
  
  controller :sessions do
    get     'login'      => :new  
    post    'login'      => :create
    get     'logout'     => :destroy
  end

  resources :users
end
