class CreateFloorPlans < ActiveRecord::Migration
  def change
    create_table :floor_plans do |t|
      t.string :residence
      t.float :price
      t.integer :bedrooms
      t.float :bathrooms
      t.string :additions
      t.float :indoor_sq_ft
      t.float :indoor_sq_m
			t.float :outdoor_sq_ft
			t.float :outdoor_sq_m
      t.float :common_charges
      t.float :monthly_total
      t.string :pilot
      t.boolean :avaliable_general
      t.boolean :avaliable_admins

			t.attachment :plan
      t.timestamps
    end
  end
end
