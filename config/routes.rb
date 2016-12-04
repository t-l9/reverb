Rails.application.routes.draw do
    devise_for :users

    resources :teams do
        resources :team_users
    end

    root to: "teams#index"
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
