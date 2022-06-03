class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      
      t.integer :customer_id
      t.integer :admin_id
      t.date :contacted_at
      t.string :weather
      t.string :staple
      t.string :main_dish
      t.string :side_dish
      t.string :dessert
      t.integer :quantity
      t.time :nap
      t.text :comment
      t.integer :humor
      t.integer :defecation
      t.integer :dafecation_number
      t.string :temperture
      t.time :temperture_time
      t.string :dinner
      t.time :dinner_time
      t.string :breakfast
      t.time :breakfast_time
      t.time :sleep_time
      t.integer :sleep_degree
      t.integer :pool
      t.time :pickup_time
      t.string :pickup_person
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
