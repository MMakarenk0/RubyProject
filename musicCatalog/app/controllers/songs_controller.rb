class SongsController < ApplicationController
  def create
    @album = Album.find(params[:album_id])
    @song = @album.songs.build(song_params)
    if @song.save
      @song.update(file_path: save_audio_file(params[:song][:audio]))
      redirect_to @album, notice: 'Song was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @album = Album.find(params[:album_id])
    @song = @album.songs.find(params[:id])
    @song.destroy
    redirect_to @album, notice: 'Song was successfully deleted.'
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end

  def save_audio_file(audio_file)
    if audio_file.present? && @song.persisted?
      audio_path = Rails.root.join('public', 'audio', "song#{@song.id}#{File.extname(audio_file.original_filename)}")
      File.open(audio_path, 'wb') do |file|
        file.write(audio_file.read)
      end
      return audio_path.to_s
    end
    return nil
  end
  
  
end
