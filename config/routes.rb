Rails.application.routes.draw do
  # トップページはrootを使って設定（get）
  #root to: 'toppages#index'
  get '/', to: 'toppages#index'

  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:create]
  
  # get '/', to: 'tasks#index' ↓トップページが２個？
  #get '/', to: 'tasks#index'
  root to: 'tasks#index'
  resources :tasks
end
