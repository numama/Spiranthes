Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # ルート
  root 'characters#index'

  # チュートリアル
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  # ユニット
  resources :characters do
    resources: :character_comments, only: [:create]
  end

  # ユーザ
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'

  # セッション
  get  'login',  to: 'sessions#new'
  post  'login',  to: 'sessions#create'
  delete  'logout',  to: 'sessions#destroy'

end
