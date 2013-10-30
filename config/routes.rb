Wikitasks::Application.routes.draw do
  resources :tasks, :only => [:create, :update, :destroy]
  resources :lists, :except => [:new, :edit, :update]
  root to: 'lists#index'
end
