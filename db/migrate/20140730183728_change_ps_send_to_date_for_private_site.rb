class ChangePsSendToDateForPrivateSite < ActiveRecord::Migration
  def change
		change_column :private_sites, :ps_send,  :date
  end
end
