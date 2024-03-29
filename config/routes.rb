Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: redirect("/#{I18n.default_locale}/store")
  
  scope '/:locale' do
    scope 'store', as: 'store' do 
      resources :order, only: %i[create destroy]
      get 'items/new', to: 'items#new'
      post 'items/new', to: 'items#create'
      get 'items/:id/edit', to: 'items#edit'
      patch 'items/:id/edit', to: 'items#update'

      resources :items, except: %i[new create edit update] do
        resources :item_rate, only: %i[create destroy]
        resources :comments, only: %i[create destroy]
      end

      root to: 'items#index'
    end

    resources :shopcart

    namespace :session do
      get 'sign_in', to: 'sign_in#new'
      post 'sign_in', to: 'sign_in#create'
      # Не работает method: :delete без js
      delete 'logout', to: 'sign_in#destroy'

      get 'sign_up', to: 'sign_up#new'
      post 'sign_up', to: 'sign_up#create'
    end
  end

  namespace :api do 
    namespace :v1 do
      resources :items, only: %i[index show create update destroy]
      resources :orders, only: %i[index show destroy]
      resources :comments, only: %i[index show create update destroy]
    end
  end

end
