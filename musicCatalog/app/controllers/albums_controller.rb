class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_path(@album)
    else
      flash.now[:alert] = "Error creating album"
    end
  end

  def show
    @album = Album.find(params[:id])
    @songs = @album.songs
    @song = @album.songs.build
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  def edit 
    @album = Album.find(params[:id])
  end 

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_path(@album), notice: "Album updated successfully"
    else
      render :edit
    end
  end

  def random
    @random_album = Album.order('RANDOM()').first
    redirect_to @random_album
  end

  private

  def album_params
    params.require(:album).permit(:title, :artist, :release_year, :copies)
  end
end
