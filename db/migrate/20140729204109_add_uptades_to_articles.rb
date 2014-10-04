class AddUptadesToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :update_section, :boolean, default: false
  end
end
