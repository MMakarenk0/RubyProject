module SongsHelper
  def path_to_audio_file(song)
    '/audio/song' + "#{song.id}#{File.extname(song.file_path)}"
  end
end
