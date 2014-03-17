class Task < ActiveRecord::Base
	belongs_to :taskdate
	belongs_to :project
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

	def project_name
  		project.try(:name)
	end

	def project_name=(name)
  		self.project = Project.find_or_create_by_name(name) if name.present?
	end
end
