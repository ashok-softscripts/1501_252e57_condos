module ChangeLogExt
	extend ActiveSupport::Concern

	included do
		before_destroy :destroy_change
		after_create :create_change
		after_update :update_change
	end

	private
	def create_change
		create_cl(:created)
	end

	def destroy_change
		create_cl(:removed)
	end

	def update_change
		cl = ChangeLog.new
		cl.who = ChangeLog.whodidit
		cl.object_id = self.id
		cl.object_type = self.class
		cl.object_name = self.title
		cl.action = :changed
		cl.object_serialized = self.serializable_hash
		# cl.object_delta = self.serializable_hash(include : self.changes )
		cl.save
	end

	def create_cl(action)
		cl = ChangeLog.new
		cl.who = ChangeLog.whodidit
		cl.object_id = self.id
		cl.object_type = self.class
		cl.object_name = self.title
		cl.action = action
		cl.object_serialized = self.serializable_hash
		cl.object_delta = self.serializable_hash
		cl.save
	end
end