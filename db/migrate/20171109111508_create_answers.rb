class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :joke_id
      t.string :description_text, null: false
      t.integer :vote_tally

      t.timestamps
    end
  end
end
