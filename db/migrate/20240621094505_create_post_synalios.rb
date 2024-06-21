class CreatePostSynalios < ActiveRecord::Migration[7.1]
  def change
    create_table :post_synalios do |t|

      t.timestamps
    end
    add_reference :post_synalios, :post, foreign_key: true
    add_reference :post_synalios, :synalio, foreign_key: true
  end
end
