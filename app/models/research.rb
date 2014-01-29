class Research < ActiveRecord::Base

	validates :title, presence: true, length:{minimum:5}
	validates :text, presence: true, length:{minimum:15}
	has_attached_file :rAttachment

end
