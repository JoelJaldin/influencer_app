Rails.application.routes.draw do
  # config/routes.rb
  resources :influencers, only: [:index]
  root "influencers#index"
  get 'influencers/index'
  get 'influencers/create'
  resources :influencers do
    collection do
      get :check_name
    end
  end

  # app/controllers/influencers_controller.rb
  def check_name
    exists = Influencer.exists?(name: params[:name])
    render json: { exists: exists }
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
