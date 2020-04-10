Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :notes

  authenticated :user do
  	root'notes#index', as: "authenticated_root"
  end										#viwe for loged in user with all post if not it will just show welcome post

  root 'welcome#index'				#non loged in user

  
end
