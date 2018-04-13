Rails.application.routes.draw do

  root 'public/static_pages#home'

  namespace :public do
    get 'static_pages/end'
    get 'static_pages/about'
    get 'static_pages/contact'
    get 'static_pages/how_to_register'
    get 'static_pages/how_to_buy'
  end

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
  omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
