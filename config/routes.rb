Rails.application.routes.draw do

  root "public/games#index"
  namespace :admin do
    resources :games
    resources :customers, only: [:index,:show,:edit,:update] do
      resources :contacts
      resources :children
      member do
        get :search_orders
      end
  end
    resources :groups
  end

  scope module: :public do
    resources :games, only:[:index, :show]
    resources :contacts
    resources :absence_notifications, only:[:new, :index, :show, :edit, :create]
    resources :customers, only:[:show, :edit, :update]

  end


 # 会員用
devise_for :customer,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


# 管理者用
devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

end

