Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "top", to: "static_pages#top", as: :top
  get "terms", to: "static_pages#terms", as: :terms
  get "privacy", to: "static_pages#privacy", as: :privacy

  resources :person_records
  resources :tags, only: [:index, :create, :destroy]

  root "person_records#index"
end
