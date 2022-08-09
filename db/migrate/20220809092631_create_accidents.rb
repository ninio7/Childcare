class CreateAccidents < ActiveRecord::Migration[6.1]
  def change
    create_table :accidents do |t|

      t.integer :admin_id
      t.integer :group_id
      t.string :principal
      t.string :lead_teacher
      t.string :homeroom_teacher
      t.string :place
      t.string :situation
      t.string :cause
      t.string :steps
      t.date :started_on


      t.timestamps
    end
  end
end
