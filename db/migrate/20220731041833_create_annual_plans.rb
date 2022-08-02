class CreateAnnualPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :annual_plans do |t|

      t.integer :admin_id
      t.integer :group_id
      t.string :principal
      t.string :lead_teacher
      t.string :homeroom_teacher
      t.text :target
      t.text :safety
      t.text :evaluation
      t.text :first_act
      t.text :first_aim
      t.text :first_nursing
      t.text :first_education
      t.text :first_environment
      t.text :first_support
      t.text :first_event
      t.text :second_act
      t.text :second_aim
      t.text :second_nursing
      t.text :second_education
      t.text :second_environment
      t.text :second_support
      t.text :second_event
      t.text :third_act
      t.text :third_aim
      t.text :third_nursing
      t.text :third_education
      t.text :third_environment
      t.text :third_support
      t.text :third_event
      t.text :fourth_act
      t.text :fourth_aim
      t.text :fourth_nursing
      t.text :fourth_education
      t.text :fourth_environment
      t.text :fourth_support
      t.text :fourth_event

      t.timestamps
    end
  end
end
