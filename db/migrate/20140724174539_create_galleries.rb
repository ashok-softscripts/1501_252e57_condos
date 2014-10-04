class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.boolean :public_available, default: false
      t.boolean :update_section, default: false
			t.boolean :neighborhood_ava, default: false
			t.boolean :private_available
			t.attachment :thumbnail

      t.timestamps
    end
  end
end
