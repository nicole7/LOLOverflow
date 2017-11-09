class CreateJokes < ActiveRecord::Migration[5.0]
  def change
    create_table :jokes do |t|
      t.string :joke, null: false
      t.string :punchline, null: false
      t.integer :vote_tally
      t.integer :user_id, null: false
      t.integer :best_answer_id
      t.integer :view_count

      t.timestamps
    end
  end
end
