class PlaylistsController < ApplicationController
  def new 
    @playlist = Playlist.new
  end

  def create
    @playlist = current_user.playlists.build(playlist_params)
    if @playlist.save
      redirect_to @playlist, notice: 'Playlist was successfully created.'
    else
      render :new
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
    @songs = @playlist.songs
  end

  def index
    @public_playlists = Playlist.where(public: true)
  end

  def update
    @playlist = Playlist.find(params[:id])
    if @playlist.update(playlist_params)
      redirect_to @playlist, notice: 'Playlist was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    redirect_to root_path, notice: 'Playlist was successfully destroyed.'
  end

  def add_to_playlists
    song_id = params[:song_id]
    playlist_ids = params[:playlist_ids]
  
    song = Song.find(song_id)
    playlists = Playlist.where(id: playlist_ids)
  
    playlists.each do |playlist|
      playlist.songs << song
      playlist.save
    end
  
    render json: { message: "Song added to playlists successfully" }, status: :ok
  end

  def remove_song_from_playlist
    song_id = params[:song_id]
    playlist_id = params[:id]
  
    playlist = Playlist.find(playlist_id)
    song = playlist.songs.find(song_id)
    playlist.songs.delete(song)
  
    render json: { message: "Song removed from playlist successfully" }, status: :ok
  end
  

  private

  def playlist_params
    params.require(:playlist).permit(:name, :public)
  end
end
