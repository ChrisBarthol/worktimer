class Task < ActiveRecord::Base
	belongs_to :taskdate
	default_scope -> { order('dtstart DESC') }
	validates :dtstart, presence: true
end
