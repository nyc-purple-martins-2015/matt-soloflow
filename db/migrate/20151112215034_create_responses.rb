class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :respondable_type, null: false
      t.integer :respondable_id, null: false
      t.integer :user_id, null: false
      t.text :content, null: false
      t.boolean :answer, null: false, default: false
      t.boolean :best, null: false, default: false
      t.timestamps null: false
    end
  end
end
