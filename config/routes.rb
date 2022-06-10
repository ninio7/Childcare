Rails.application.routes.draw do
  root "public/games#index"

  namespace :admin do
    resources :games do
      resource :favorites, only:[:create, :destroy]
    end
    resources :customers, only: [:index,:show,:edit,:update] do
      resources :contacts
      get "confirm"=>"customers#confirm"
      resources :children
      resources :absents
      end
    get "search"=>"customers#search"
    resources :groups
    resources :notifications, only:[:index]
  end

  scope module: :public do
    resources :games do
      resource :favorites, only:[:create, :destroy]
    end
    resources :contacts
    resources :absents
    resources :customers, only:[:show, :edit, :update]
    resources :notifications, only:[:index]
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

