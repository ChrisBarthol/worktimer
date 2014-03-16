class Project < ActiveRecord::Base
	belongs_to :customer
	default_scope -> { order('created_at DESC') }
	validates :customer_id, presence: true
	validates :name, presence: true
end
