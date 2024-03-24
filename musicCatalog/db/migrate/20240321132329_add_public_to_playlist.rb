class AddPublicToPlaylist < ActiveRecord::Migration[7.1]
  def change
    add_column :playlists, :public, :boolean
  end
end
