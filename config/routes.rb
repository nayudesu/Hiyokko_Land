Rails.application.routes.draw do

  namespace :public do
    resources :posts
  end


  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do

  end


  devise_for :members,controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :public do

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

