class AddChildrenCustomer < ActiveRecord::Migration[6.1]
  def change
    
   add_column :children, :customer_id, :integer
  end
end
