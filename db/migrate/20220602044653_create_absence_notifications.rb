class CreateAbsenceNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :absence_notifications do |t|
      t.integer :customer_id
      t.integer :admin_id
      t.string :type
      t.date :start_at
      t.string :symptom
      t.text :note
      t.timestamps
    end
  end
end
