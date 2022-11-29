Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :flowers do
        get 'today_flower' to: 'today_flower#index'
      end
      post 'login', to: 'user_sessions#create'
      delete 'logout', to: 'user_sessions#destroy'
    end
  end
end
