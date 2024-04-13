Rails.application.routes.draw do
  root 'albums#index'

  resources :albums do
    get 'random_album', to: 'albums#random', on: :collection
    resources :songs, only: %i[index create destroy]
  end

  resources :playlists do
    post 'add_to_playlists', on: :member
    post 'remove_song_from_playlist', on: :member
  end
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create show index]
end
