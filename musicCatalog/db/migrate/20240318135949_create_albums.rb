class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.string :artist
      t.string :title
      t.integer :release_year
      t.integer :duration
      t.integer :copies

      t.timestamps
    end
  end
end
