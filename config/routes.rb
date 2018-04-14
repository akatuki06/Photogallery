Rails.application.routes.draw do

  root 'public/static_pages#home'

  namespace :public do
    get 'static_pages/end'
    get 'static_pages/about'
    get 'static_pages/contact'
    get 'static_pages/how_to_register'
    get 'static_pages/how_to_buy'
  end

  namespace :admin do
  end

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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
