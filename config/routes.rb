Wikitasks::Application.routes.draw do
  resources :tasks, :except => [:show, :new]
  resources :lists, :except => [:new]
  root to: 'lists#index'
end
