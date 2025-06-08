Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "creatures#index"

  # Creatures routes
  resources :creatures

  # CreatureResources routes (and their Tags)
  resources :creature_resources
  patch "shift_resource_order" => "creature_resources#shift_order"
  resources :tags

  # Pages for users
  get "about" => "pages#about"

  # Pages for admins
  namespace :admin do
    get "home" => "pages#home"
  end

  # Slug-based creature routes (must be last to avoid conflicts)
  get ":slug", to: "creatures#show", constraints: { slug: /[a-z0-9\-]+/ }
end
