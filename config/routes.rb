Rails.application.routes.draw do

  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root to: 'homes#top'
    resources :posts, only: [:show, :index, :edit, :update, :destroy] do
      resources :post_comments, only: [:destroy]
    end
    resources :members, only: [:show, :index, :edit, :update]
    resources :genres
  end


  devise_for :members,controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :public do
    get 'members/:id/unsubscribe' => 'members#unsubscribe', as:'unsubscribe'
    patch '/members/:id/withdraw' => 'members#withdraw', as:'withdraw'
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'search' => 'searches#search'
    resources :posts do
      resources :post_comments, except: [:index, :show, :new, :edit]
      resource :favorites, only: [:create, :destroy]
    end
    resources :members, only: [:show, :edit, :update]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

