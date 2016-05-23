Rails.application.routes.draw do
  root 'home#index'

  scope '/api', defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'

    namespace :v1 do
      resources :recipes do 
        member do
          post "favorites" => "favorite_recipes#create"
          delete "favorites" => "favorite_recipes#destroy"
        end

        collection do
          get "favorites" => "favorite_recipes#index"
        end
      end
    end
  end
end
