class AddColumnsIntoOrder2 < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders,  :status, :string
  	
  end
end