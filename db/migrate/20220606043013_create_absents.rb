class CreateAbsents < ActiveRecord::Migration[6.1]
  def change
    create_table :absents do |t|

      t.integer :customer_id
      t.integer :child_id
      t.integer :admin_id
      t.integer :kind
      t.date :started_on
      t.date :finished_on
      t.string :symptom
      t.text :note
      t.timestamps
    end
  end
end




