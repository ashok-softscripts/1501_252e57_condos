class VideoSection < ActiveRecord::Base
	include ChangeLogExt

	attr_accessible :title, :section, :body
end
