class AddSignitureToPrivateSite < ActiveRecord::Migration
  def change
		add_column :private_sites, :welcome_signiture, :string
  end
end
