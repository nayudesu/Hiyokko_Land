Rails.application.routes.draw do

  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root to: 'homes#top'
  end


  devise_for :members,controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  namespace :public do
    resources :members, only: [:show, :edit, :update]

  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :posts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

