class AddTaskdateToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :taskdate_id, :integer
  end
end
