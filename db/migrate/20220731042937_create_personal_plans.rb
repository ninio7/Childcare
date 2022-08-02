class CreatePersonalPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :personal_plans do |t|

      t.integer :admin_id
      t.integer :group_id
      t.integer :child_id
      t.string :principal
      t.string :lead_teacher
      t.string :homeroom_teacher
      t.text :act
      t.text :aim
      t.text :contents
      t.text :support
      t.text :evalution

      t.timestamps
    end
  end
end
