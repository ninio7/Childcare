class CreateWeeklyPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :weekly_plans do |t|
      
      t.integer :admin_id
      t.integer :group_id
      t.integer :weeks
      t.string :principal
      t.string :lead_teacher
      t.string :homeroom_teacher
      t.text :lastweek_act
      t.text :aim
      t.text :event
      t.text :mon_act
      t.text :mon_support
      t.text :tue_act
      t.text :tue_support
      t.text :wed_act
      t.text :wed_support
      t.text :thu_act
      t.text :thu_support
      t.text :fri_act
      t.text :fri_support
      t.text :sat_act
      t.text :sat_support

      t.timestamps
    end
  end
end
