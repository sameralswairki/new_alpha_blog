Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  #resources provided REST-ful routes to Rails resources
  resources :articles#, only: [:show, :index, :new, :create, :edit, :update]
end

