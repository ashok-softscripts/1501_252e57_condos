class CreatePrivateVideos < ActiveRecord::Migration
  def change
    create_table :private_videos do |t|
      t.string :title
      t.string :url
      t.boolean :update_section, default: false
			t.attachment :thumbnail

      t.timestamps
    end
  end
end
