class CreatePublicUsers < ActiveRecord::Migration
  def change
    create_table :public_users do |t|
			t.string :name
			t.boolean :broker
			t.string :phone
			t.string :email
			t.string :country
			t.string :size
			t.text :comment

      t.timestamps
    end
  end
end
