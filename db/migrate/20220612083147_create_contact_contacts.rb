class CreateContactContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_contacts do |t|

      t.integer :customer_contact_id
      t.integer :admin_contact_id
      t.integer :day
      t.timestamps
    end
  end
end
