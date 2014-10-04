class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.string :name
      t.string :alt_name
      t.integer :sequence
      t.integer :gallery_id
			t.attachment :image
      t.timestamps
    end
  end
end
