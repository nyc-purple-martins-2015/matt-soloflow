class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :category, null: false

      t.timestamps null: false
    end
  end
end
