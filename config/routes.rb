Rails.application.routes.draw do


  resources :users

  root 'inicio#index'

end
