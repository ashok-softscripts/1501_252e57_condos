class AddedUsersToPrivateSite < ActiveRecord::Migration
  def change
		add_column :private_sites, :user_id, :integer
	end
end
