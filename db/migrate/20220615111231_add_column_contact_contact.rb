class AddColumnContactContact < ActiveRecord::Migration[6.1]
  def change
    add_column :contact_contacts, :admin_id, :integer
    add_column :contact_contacts, :customer_id, :integer
  end
end
