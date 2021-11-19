Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: redirect('/market')
  resources :market, only: :index

  scope :market do
    resources :product
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
