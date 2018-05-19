Rails.application.routes.draw do
  devise_for :user
  namespace :api, :defaults => {:format => :json} do
  	namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :roles
      resources :offices
      resources :activities
      resources :careers
      resources :office_careers , only: [:create, :update, :destroy]
      resources :process_level_statuses
      resources :process_levels
      resources :project_processes
      post 'users/assign-role' => 'users#assign_role'
      get 'activities/find-by-process-level' => 'activities#find_by_process_level'
      get 'process-levels/find-by-process' => 'process_levels#find_by_process'
  	end
end
end
