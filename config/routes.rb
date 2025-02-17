Rails.application.routes.draw do
  root "influencers#index"

  resources :influencers, except: [:new, :edit] do
    collection do
      get :check_name
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
