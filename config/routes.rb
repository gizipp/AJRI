Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :goals
      end
    end
  end
end
