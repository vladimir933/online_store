Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: redirect('/market')
  resources :market, only: :index

  scope :market do
    resources :product
  end

  resources :shopcart

end
