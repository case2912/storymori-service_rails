Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    resources :stories, only:[:index,:create] do
      resources :pages, only:[:show] do
      post 'next'
      end
    end
  end
end
