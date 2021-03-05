Rails.application.routes.draw do
  resources :courses
  resources :subjects
  get 'static_pages/subjects'
  get 'static_pages/courses'
  get 'static_pages/instructors'
  resources :instructors
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
