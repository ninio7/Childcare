class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      
      t.integer :customer_id
      t.integer :admin_id
      t.integer :child_id
      t.string :weather
      t.string :staple
      t.string :main
      t.string :side
      t.string :dessert
      t.integer :staple_quantity
      t.integer :main_quantity
      t.integer :side_quantity
      t.integer :dessert_quantity
      t.time :nap_started_at
      t.time :nap_finished_at
      t.text :comment
      t.integer :humor
      t.integer :defecation
      t.integer :defecation_number
      t.string :temperture
      t.time :tempertured_at
      t.string :dinner
      t.integer :dinner_quantity
      t.time :dinner_time
      t.string :breakfast
      t.integer :breakfast_quantity
      t.time :breakfast_time
      t.time :sleep_started_at
      t.time :sleep_finished_at
      t.integer :sleep_degree
      t.integer :pool
      t.time :pickuped_at
      t.string :pickup_person
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
