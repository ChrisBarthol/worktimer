class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :projects, :company_id, :customer_id
  end
end
