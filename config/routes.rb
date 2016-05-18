Rails.application.routes.draw do
  root 'home#index'

  scope '/api', defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'

    namespace :v1 do
      resources :recipes
    end
  end
end
