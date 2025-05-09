Rails.application.routes.draw do
  root to: "products#index"

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :products, only: [ :index, :show ] do
    collection do
      get "search_results"
    end
  end
  resources :categories, only: [ :index, :show ]
  resources :cart, only: [ :index, :create, :destroy ] do
    patch "update_quantity", on: :member
  end

  scope "/checkout" do
    get "shipping", to: "checkout#shipping", as: "checkout_shipping"
    post "invoice", to: "checkout#invoice", as: "checkout_invoice"
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
