Rails.application.routes.draw do

  # Generated routes
  resources :organizations
  resources :teams
  resources :students

  # Routes for student_teams
  get 'student_teams/new',             to: 'student_teams#new',       as: :new_student_team
  post 'student_teams',                to: 'student_teams#create',    as: :student_teams
  patch 'student_teams/:id/terminate', to: 'student_teams#terminate', as: :terminate_student_team
  delete 'student_teams/:id',          to: 'student_teams#destroy',   as: :remove_student_team

  # Semi-static page routes
  get 'home',         to: 'home#index',   as: :home
  get 'home/about',   to: 'home#about',   as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy

  # You can have the root of your site routed with 'root'
  root 'home#index'
end
