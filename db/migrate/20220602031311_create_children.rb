class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      
      t.integer :group_id
      t.string :name
      t.string :kana_name
      t.date :birthday
      t.timestamps
    end
  end
end
