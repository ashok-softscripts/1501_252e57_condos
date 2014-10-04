class CreateSiteItems < ActiveRecord::Migration
  def change
    create_table :site_items do |t|
      t.integer :private_site_id
      t.string :si_update
			t.references :si_item, polymorphic: true
      t.timestamps
    end
  end
end
