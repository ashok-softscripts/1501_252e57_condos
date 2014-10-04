class CreateVideoSections < ActiveRecord::Migration
  def change
    create_table :video_sections do |t|
      t.string :section
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
