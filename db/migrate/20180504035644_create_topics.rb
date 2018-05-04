class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.string :description
      t.string :image
      t.text :content
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
