Rails.application.routes.draw do
  

  
  
  resources :orders
  resources :line_items
  resources :carts
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  

  resources :categories
  resources :products do
    collection do
             get 'search'
     end
    resources :reviews, except: [:show, :index]
  end
  resources :users
  root 'static_pages#home'

  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  

end
