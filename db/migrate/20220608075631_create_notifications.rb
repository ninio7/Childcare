class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :customer, foreign_key: true
      t.boolean :send_by_admin, default: false, null: false
      t.references :contact, foreign_key: true, null: true
      t.references :absent, foreign_key: true, null: true
      t.references :admin, foreign_key: true, null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
