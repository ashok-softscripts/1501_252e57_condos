class AddedDetailsToSiteItems < ActiveRecord::Migration
  def change
		add_column :site_items, :si_detail, :boolean, default: false
  end
end
