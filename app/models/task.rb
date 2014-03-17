class Task < ActiveRecord::Base
	belongs_to :taskdate
	default_scope -> { order('dtstart DESC') }
	validates :dtstart, presence: true
	validates :totaltime, presence: true
	validates :user_id, presence: true
	validates :project_id, presence: true
	validates :customer_id, presence: true
	validates :description, presence: true
end
