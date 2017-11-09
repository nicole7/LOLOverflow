5.times do
  User.create!(username: Faker::Internet.user_name, email: Faker::Internet.safe_email, password: Faker::Internet.password(8, 14))
end

20.times do
  Joke.create!(joke: Faker::Hipster.sentences.join, punchline: Faker::Hipster.sentences.join, vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)
end

20.times do
  Answer.create!(user_id: rand(1..5), joke_id: rand(1..20), description_text: Faker::Hipster.sentences.join, vote_tally: 0)
end

10.times do
  Vote.create!(votable_type: "Answer", votable_id: rand(1..20), user_id: rand(1..5))
  Vote.create!(votable_type: "Joke", votable_id: rand(1..20), user_id: rand(1..5))
end

10.times do
  Comment.create!(description_text: Faker::Hipster.sentences.join, commentable_type: "Answer", user_id: rand(1..5), commentable_id: rand(1..20))
  Comment.create!(description_text: Faker::Hipster.sentences.join, commentable_type: "Joke", user_id: rand(1..5), commentable_id: rand(1..20))
end
