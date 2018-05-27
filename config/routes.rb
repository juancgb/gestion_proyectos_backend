Rails.application.routes.draw do
  devise_for :user
  namespace :api, :defaults => {:format => :json} do
  	namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      post 'users/assign_role' => 'users#assign_role'
      get 'activities/find_by_process_level' => 'activities#find_by_process_level'
      get 'careers/find_career_by_office' => 'office_careers#find_career_by_office'
      get 'careers/find_office_by_career' => 'office_careers#find_office_by_career'
      get 'process_levels/find_by_process' => 'process_levels#find_by_process'
      get 'project_processes/find_by_office' => 'project_processes#find_by_office'
      get 'project_processes/find_by_career' => 'project_processes#find_by_career'
      get 'project_processes/find_by_office_career' => 'project_processes#find_by_office_career'
      resources :roles
      resources :offices
      resources :activities
      resources :careers
      resources :office_careers , only: [:create, :update, :destroy]
      resources :process_level_statuses
      resources :process_levels
      resources :project_processes
  	end
end
end
