class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.uuid :uuid, default: -> { "gen_random_uuid()" }, null: false
      t.string :title, null: false
      t.text :caption, null: false
      t.integer :publish_state, default: 0, null: false
      t.datetime :published_at
      t.string :postable_type, null: false
      t.timestamps
    end
    add_index :posts, :uuid, unique: true
    add_index :posts, :postable_type
  end
end
