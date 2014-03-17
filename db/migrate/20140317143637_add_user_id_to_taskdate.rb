class AddUserIdToTaskdate < ActiveRecord::Migration
  def change
  	add_column :taskdates, :user_id, :integer
  end
end
