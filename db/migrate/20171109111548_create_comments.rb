class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :description_text, null: false
      t.string :commentable_type, null: false
      t.integer :user_id
      t.integer :commentable_id

      t.timestamps
    end
  end
end
