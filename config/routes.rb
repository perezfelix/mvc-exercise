# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions' }
  devise_for :users, path: 'users', controllers: { sessions: 'users/sessions' }
  root 'administration/items#index'

  get '/home', to: 'home#landing_page'

  namespace 'administration' do
    root to: 'items#index'

    resources :items
  end
end
