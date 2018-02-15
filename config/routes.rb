Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :jobs do
    resources :comments
  end
  root 'jobs#index'
end
