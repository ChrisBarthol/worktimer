class AddProjectNameToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :projectname, :string
  end
end
