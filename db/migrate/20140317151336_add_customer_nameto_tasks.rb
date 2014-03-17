class AddCustomerNametoTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :companyname, :string
  end
end
