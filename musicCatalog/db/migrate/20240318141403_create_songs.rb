class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.references :album, null: false, foreign_key: true
      t.string :title
      t.integer :duration

      t.timestamps
    end
  end
end
