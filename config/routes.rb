Rails.application.routes.draw do
  root 'home#index'

  resources 'recipes'

  scope '/api' do
    mount_devise_token_auth_for 'User', at: 'auth'
  end
end
