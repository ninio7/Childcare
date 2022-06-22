class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :customer, foreign_key: true, type: :integer
      t.boolean :send_by_admin, default: false, null: false
      t.references :contact, foreign_key: true, null: true, type: :integer
      t.references :absent, foreign_key: true, null: true, type: :integer
      t.references :news, foreign_key: true, null: true, type: :integer
      t.references :admin, foreign_key: true, null: false, type: :integer
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
