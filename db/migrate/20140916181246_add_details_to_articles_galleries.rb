class AddDetailsToArticlesGalleries < ActiveRecord::Migration
  def change
		add_column :articles, :detail_section, :boolean, default: false
		add_column :galleries, :detail_section, :boolean, default: false
  end
end
