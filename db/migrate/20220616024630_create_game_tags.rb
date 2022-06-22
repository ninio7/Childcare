class CreateGameTags < ActiveRecord::Migration[6.1]
  def change
    create_table :game_tags do |t|
      t.references :game, foreign_key: true, type: :integer
      t.references :tag, foreign_key: true, type: :integer

      t.timestamps
    end
    add_index :game_tags, [:game_id, :tag_id], unique: true
  end
end
