class CreateTaskdates < ActiveRecord::Migration
  def change
    create_table :taskdates do |t|
      t.date :thedate

      t.timestamps
    end
  end
end
