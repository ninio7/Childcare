class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.integer :admin_id
      t.integer :group_id
      t.date :started_on
      t.date :finished_on
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
