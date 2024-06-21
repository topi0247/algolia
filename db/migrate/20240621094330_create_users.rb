class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.uuid :uuid, default: -> { "gen_random_uuid()" }, null: false
      t.string :name, null: false
      t.timestamps
    end
    add_index :users, :uuid, unique: true
    add_reference :posts, :user, foreign_key: true
  end
end
