class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.string :votable_type, null: false
      t.integer :votable_id
      t.integer :user_id

      t.timestamps
    end
  end
end
