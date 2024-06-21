class CreatePostGameSystems < ActiveRecord::Migration[7.1]
  def change
    create_table :post_game_systems do |t|
      t.integer :game_system_id, null: false
      t.timestamps
    end
    add_reference :post_game_systems, :post, foreign_key: true
  end
end
