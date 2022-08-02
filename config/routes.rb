Rails.application.routes.draw do

  root "public/games#index"
  # get "contact_contact/:id" => "contact_contacts#show", as: 'contact_contact'

  # 管理者用
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :news
    resources :games do
      resource :favorites, only: [:create, :destroy]
    end
    resources :customers, only: [:index,:show,:edit,:update] do
      resources :contacts
      resources :contact_contacts, only: [:show]
      resources :children
      resources :absents, only: [:index]
    end

    get "search"=>"customers#search"
    resources :groups do
      resources :personal_plans
      resources :annual_plans
    end
    get "groups/:id/about"=>"groups#about", as: 'about'
    resources :notifications, only:[:index]
    get "search_tag"=>"games#search_tag"
  end

   # 会員用
  devise_for :customer,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    resources :games, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :contacts, only: [:index, :new, :create, :edit, :update, :destroy]
    get 'contact', to: 'contacts#show', as: 'show_contact'
    resources :absents, only: [:index, :show, :create, :new, :destroy]
    resources :customers, only:[:show, :edit, :update]
    resources :notifications, only:[:index]
    resources :favorites, only:[:index]
    get "search_tag"=>"games#search_tag"
  end


end

