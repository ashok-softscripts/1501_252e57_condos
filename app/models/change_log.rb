class ChangeLog < ActiveRecord::Base
	cattr_accessor :whodidit
	default_scope -> {order('created_at DESC')}
end
