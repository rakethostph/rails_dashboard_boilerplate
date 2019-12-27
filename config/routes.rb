Rails.application.routes.draw do
  
      
      resources :warranties
      resources :products
      resources :profiles, only:[:new, :edit, :update, :index]
     
      get 'distributor_page', to: 'pages#distributor_page'
      get 'agent_page', to: 'pages#agent_page'
      get 'client_page', to: 'pages#client_page'

  devise_for :users, skip: [:sessions], :path_prefix => 'my'
  resources :users
  
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session

    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  devise_scope :user do
    

    authenticated :user do

      
      root to: 'pages#dashboard', as: :authenticated_root
    end

    unauthenticated do

      root to: 'pages#index', as: :unauthenticated_root
    end
  end
  get '*path' => redirect('/404.html')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
