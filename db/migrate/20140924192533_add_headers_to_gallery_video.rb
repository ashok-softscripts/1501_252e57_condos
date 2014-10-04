class AddHeadersToGalleryVideo < ActiveRecord::Migration
  def change
		add_column :galleries, :heading, :string
		add_column :private_videos, :heading, :string
  end
end
