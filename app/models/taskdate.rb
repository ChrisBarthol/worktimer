class Taskdate < ActiveRecord::Base
	has_many :tasks, dependent: :destroy
	accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a[:dtstart].empty? }

end
