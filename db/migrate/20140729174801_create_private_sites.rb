class CreatePrivateSites < ActiveRecord::Migration
  def change
    create_table :private_sites do |t|
      t.string :receiver_email
      t.string :receiver_name
      t.string :email_cc
      t.string :email_bcc
      t.text :ps_email
      t.text :welcome_msg
      t.string :ps_specials
      t.string :uniq_ident
      t.boolean :ps_send

      t.timestamps
    end
  end
end
