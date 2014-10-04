class AddPublisdhedDateToPrivateVideo < ActiveRecord::Migration
  def change
		add_column :private_videos, :published_date, :date
		add_column :galleries, :published_date, :date
  end
end
