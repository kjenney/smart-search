class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.text :uri
      t.text :name
      t.integer :length
      t.text :image_uri
      t.text :iframe
      t.text :tags
      t.string :actor
      t.integer :vid
      t.string :category
      t.string :mode

      t.timestamps
    end
    add_index :videos, :name, :length => { :name => 500}
  end
end