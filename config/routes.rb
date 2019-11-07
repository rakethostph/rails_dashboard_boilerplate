Rails.application.routes.draw do

  resources :profiles, only:[:edit, :update]
  # post 'profiles#create'
  # get '/profiles/:id/edit', to: 'profiles#edit', as: :edit_profile
  # patch  '/profiles/:id', to: 'profiles#update'
  # put '/profiles/:id', to: 'profiles#update'
  
  
  devise_for :users, skip: [:sessions]
  as :user do

    # get 'forgot_password', to: 'devise/passwords#new', as: :new_user_password
    # post 'forgot_password', to: 'devise/passwords#create', as: :user_password
   
    # get 'confirmations', to: 'confirmations#new', as: :new_user_confirmation
    # post 'confirmations', to: 'confirmations#create', as: :user_confirmation

    # get 'signup', to: 'devise/registrations#new', as: :new_user_registration
    # post 'signup', to: 'devise/registrations#create', as: :user_registration

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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
