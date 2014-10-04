class CreateChangeLogs < ActiveRecord::Migration
  def change
    create_table :change_logs do |t|
      t.string :who
      t.string :action
      t.string :object_type
      t.integer :object_id
      t.string :object_name
      t.boolean :for_admin
			t.text :object_serialized
			t.text :object_delta
      t.timestamps
    end
  end
end
