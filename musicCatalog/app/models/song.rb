class Song < ApplicationRecord
  belongs_to :album

  validates :title, presence: true
  
  after_destroy :delete_audio_file

  private

  def delete_audio_file
    if file_path.present? && File.exist?(file_path)
      File.delete(file_path)
      puts "Audio file #{file_path} successfully deleted"
    else
      puts "Audio file not found for song #{id}"
    end
  end
end