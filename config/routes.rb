# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admins/sessions',
    confirmations: 'admins/confirmations',
    registrations: 'admins/registrations',
    passwords: 'admins/passwords',
    unlocks: 'admins/unlocks'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks'
  }
  root 'administration/items#index'

  get '/home', to: 'home#landing_page'

  namespace 'administration' do
    get "/", to: 'items#index'

    resources :items
  end
end
