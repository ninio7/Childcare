class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :customer, foreign_key: true, type: :bigint
      t.boolean :send_by_admin, default: false, null: false
      t.references :contact, foreign_key: true, null: true, type: :bigint
      t.references :absent, foreign_key: true, null: true, type: :bigint
      t.references :news, foreign_key: true, null: true, type: :bigint
      t.references :admin, foreign_key: true, null: false, type: :bigint
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
