Rails.application.routes.draw do
  root 'movies#index'
  get 'timeline' => 'homes#timeline'
  get 'ranking' => 'homes#ranking'
  get 'about' => 'homes#about'
  get 'search' => 'searches#search'
  get 'reviews/search' => 'reviews#search'
  get 'users/search' => 'users#search'

 post '/homes/guest_sign_in' => 'homes#new_guest'

 devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
  end

  resources :movies, only: [:index, :show] do
    resource :interest, only: [:create, :destroy]
  end

  resources :reviews do
    resource :good, only: [:create, :destroy] # /reviews/:review_id/good ①review_idをURLに持たせることでgoodのsave時などでreview_idを取得しやすいのでネストにしている。②/:good_idは不要(showページ不要)なのでresource。
    resource :bad, only: [:create, :destroy] # /reviews/:review_id/bad ①review_idをURLに持たせることでbadのsave時などでreview_idを取得しやすいのでネストにしている。②/:bad_idは不要(showページ不要)なのでresource。
  end

end
