Rails.application.routes.draw do
  root                 'static_pages#home'
  get  'home'       => 'static_pages#home'
  get  'help'       => 'static_pages#help'
  get  'about'      => 'static_pages#about'
  get  'contact'    => 'static_pages#contact'
  get  'sign'       => 'user#new'  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
