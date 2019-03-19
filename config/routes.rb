Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # ルート
  root 'static_pages#top'

  # チュートリアル
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  # ユニット
  resources :characters
  get 'evaluate', to: 'characters#evaluate'

  # アビリティ
  resources :abilities, only: [:show]

  # Q&A
  resources :questions

  # ユーザ
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'

  # セッション
  get  'login',  to: 'sessions#new'
  post  'login',  to: 'sessions#create'
  delete  'logout',  to: 'sessions#destroy'

  # 静的ページ
  get 'information', to: 'static_pages#information', as: 'information'

end
