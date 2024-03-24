class AddFilePathToSongs < ActiveRecord::Migration[7.1]
  def change
    add_column :songs, :file_path, :string
  end
end
