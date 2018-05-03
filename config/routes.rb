Rails.application.routes.draw do
  devise_for :user
  namespace :api, :defaults => {:format => :json} do
  	namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :roles
      resources :offices
      post 'users/assign-role' => 'users#assign_role'
  	end
end
end
