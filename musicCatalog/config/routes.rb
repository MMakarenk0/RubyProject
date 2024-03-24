Rails.application.routes.draw do

  root "albums#index"

  resources :albums do
    get 'random_album', to: 'albums#random', on: :collection
    resources :songs, only: [:index, :create, :destroy]
  end
  
  resources :playlists do
    post 'add_to_playlists', on: :member
    post 'remove_song_from_playlist', on: :member
  end
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :index]


end
