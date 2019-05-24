# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    resources :stories, only: %i[index create] do
      resources :pages, only: [:show] do
        post 'next'
      end
    end
  end
end
