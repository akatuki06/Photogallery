Rails.application.routes.draw do

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

    get 'static_pages/test'

    get 'users/show'
    get '/users/unsubscribe'
    patch '/users/soft_delete'
    resource :artists, except: [:show]
    resources :artists, only: [:index, :show]
    patch '/work/:id/soft_delete', to: 'works#soft_delete', as: 'work_soft_delete'
    resources :works
    resource :addresses
    resources :line_items, only: [:create, :update, :destroy]
    resources :carts, only: [:show, :destroy]
    resources :orders do
      collection do
        get 'new_for_users'
        post 'confirm'
      end
    end

  end

  scope module: :admin do
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
