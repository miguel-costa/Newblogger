Rails.application.routes.draw do
  root to: 'articles#index'
    resources :articles do
        resources :comments
        resources :attachments
    end

    resources :tags
    
    # ... other resources we have defined ...
    resources :authors

    resources :author_sessions, only: [ :new, :create, :destroy ]

    get 'login'  => 'author_sessions#new'
    get 'logout' => 'author_sessions#destroy'
end
