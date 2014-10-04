class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
			t.date :published_date
			t.attachment :article

      t.timestamps
    end
  end
end
