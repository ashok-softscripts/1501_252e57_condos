class SiteItem < ActiveRecord::Base
	belongs_to :private_site
	belongs_to :si_item, :polymorphic => true
end
