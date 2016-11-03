Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teachers
  resources :groups
  resources :audiences
  resources :subjects
  root 'teachers#index'
end
