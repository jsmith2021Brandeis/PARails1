Rails.application.routes.draw do
  resources :enrollments
  resources :users
  resources :courses
  resources :subjects
  get 'static_pages/subjects'
  get 'static_pages/courses'
  get 'static_pages/instructors'
  resources :instructors
  root 'welcome#index'
  get '/signup', to: 'users#new'
  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
