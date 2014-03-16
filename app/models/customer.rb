class Customer < ActiveRecord::Base
	before_save { self.company = company.downcase }
	validates :company, presence: true
	default_scope -> { order('company DESC') }

	has_many :projects, dependent: :destroy

	def self.to_csv(options={})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |customer|
				csv << customer.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
  		CSV.foreach(file.path, headers: true) do |row|
    		Customer.create! row.to_hash
  		end
	end
end
