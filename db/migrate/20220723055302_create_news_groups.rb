class CreateNewsGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :news_groups do |t|
      t.integer :group_id
      t.integer :news_id

      t.timestamps
    end
  end
end
