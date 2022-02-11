Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: redirect("/#{I18n.default_locale}/store")
  
  scope '/:locale' do
    namespace :store do
      resources :order, only: %i[index create destroy]
      get 'item/new', to: 'item#new'
      post 'item/new', to: 'item#create'
      get 'item/:id/edit', to: 'item#edit'
      patch 'item/:id/edit', to: 'item#update'

      resources :item, except: %i[new create edit update] do
        resources :item_rate, only: %i[create destroy]
      end

      root to: 'order#index'
    end

    resources :shopcart

    namespace :session do
      get 'sign_in', to: 'sign_in#new'
      post 'sign_in', to: 'sign_in#create'
      delete 'logout', to: 'sign_in#destroy'

      get 'sign_up', to: 'sign_up#new'
      post 'sign_up', to: 'sign_up#create'
    end
  end

end
