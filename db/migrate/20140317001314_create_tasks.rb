class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.datetime :dtstart
      t.datetime :dtstop
      t.integer  :customer_id
      t.integer  :project_id
      t.integer  :user_id
      t.time     :totaltime
      t.text     :description

      t.timestamps
    end
  end
end
