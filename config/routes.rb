Rails.application.routes.draw do

  namespace :admin do
    get 'exhibitions/index'
  end

  root 'public/static_pages#home'

  devise_for :admins, controllers: {
  sessions:      'admin/admins/sessions',
  passwords:     'admin/admins/passwords',
  registrations: 'admin/admins/registrations'
  }
  devise_for :users, controllers: {
  sessions:      'public/users/sessions',
  passwords:     'public/users/passwords',
  registrations: 'public/users/registrations',
  omniauth_callbacks: 'public/users/omniauth_callbacks'
  }

  scope module: :public do
    get 'static_pages/end'
    get 'static_pages/about'
    get 'static_pages/contact'
    get 'static_pages/how_to_register'
    get 'static_pages/how_to_buy'
    get 'static_pages/entrance'
    get 'sales/index'
    get 'clips/index'
    get 'users/show'
    get '/users/unsubscribe'
    patch '/users/soft_delete'
    resource :artists, except: [:show]
    resources :artists, only: [:index, :show] do
      resource :clip_artists, only: [:create, :destroy]
    end
    patch '/work/:id/soft_delete', to: 'works#soft_delete', as: 'work_soft_delete'
    resources :works do
      resource :clip_works, only: [:create, :destroy]
    end
    resource :addresses
    resources :line_items, only: [:create, :update, :destroy]
    resources :carts, only: [:show, :destroy]
    resource :exhibitions, except: [:show]
    resources :exhibitions, only: [:index, :show] do
      resource :clip_exhibitions, only: [:create, :destroy]
    end
    resources :orders do
      collection do
        get 'new_for_users'
        post 'confirm'
      end
    end

  end

  namespace :admin do
    get 'sales/index'
    resources :orders, only: [:index, :show, :edit, :update]
    resources :works, only: [:index, :show, :update]
    resources :artists, only: [:index, :show, :update]
    resources :users, only: [:index, :show, :update]
    resources :exhibitions, only: [:index, :destroy]

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
