class Task < ActiveRecord::Base
	belongs_to :taskdate
	default_scope -> { order('dtstart DESC') }
	validates :dtstart, presence: true

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |task|
				csv << task.attributes.values_at(*column_names)
			end
		end
	end
end
