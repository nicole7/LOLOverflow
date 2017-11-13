5.times do
  User.create!(username: Faker::Internet.user_name, email: Faker::Internet.safe_email, password: Faker::Internet.password(8, 14))
end


  Joke.create!(joke: "Did you hear about the 2 silk worms in a race?", punchline: "It ended in a tie!", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

  Joke.create!(joke: "Why did the one-handed man cross the road?", punchline: "To get to the second hand shop", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

  Joke.create!(joke: "Why did the turkey cross the road?", punchline: "Because he wasnt a chicken.", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

  Joke.create!(joke:  "What do you call a laughing motorcycle?", punchline: "A Yamahahaha.", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

  Joke.create!(joke:  "Did you hear about the guy who got hit in the head with a can of soda?", punchline: "He was lucky it was a soft drink", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

  Joke.create!(joke:  "A termite walks into a bar and says...", punchline: "“Where is the bar tender?”", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

  Joke.create!(joke:  "What’s the difference between a poorly dressed man on a bicycle and a nicely dressed man on a tricycle?", punchline: "A tire.", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

  Joke.create!(joke:  "What does C.S. Lewis keep at the back of his wardrobe?", punchline: "Narnia business!", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

  Joke.create!(joke:  "What is Forrest Gump’s email password?", punchline: "1Forrest1", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

  Joke.create!(joke:  "Why did the can crusher quit his job?", punchline: "Because it was soda pressing.", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

  Joke.create!(joke:  "Why is peter pan always flying?", punchline: "He neverlands.", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

  Joke.create!(joke:  "Did you hear about the mathematician who was afraid of negative numbers? ", punchline: "He’d stop at nothing to avoid them.", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

 Joke.create!(joke:  "What did the librarian say when the books were in a mess?", punchline: "We ought to be ashamed of ourshelves!", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

  Joke.create!(joke:  "Who was Socrates’ worst student?", punchline: "Mediocrities", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

Joke.create!(joke:  "Who was Socrates’ busiest student?", punchline: "The one with a lot on his Plato", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

Joke.create!(joke:  "Why did the tomato blush?", punchline: "Because it saw the salad dressing.", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

Joke.create!(joke:  "What do you call cheese that isn’t yours?", punchline: "Nacho cheese!", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

Joke.create!(joke:  "Why do hamburgers go to the gym?", punchline: "To get better buns.", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

Joke.create!(joke:  "Did you hear about the boy who tried to catch fog?", punchline: "He mist.", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

Joke.create!(joke:  "What did the beach say as the tide came in?", punchline: "Long time, no sea.", vote_tally: 0, user_id: rand(1..5),  best_answer_id: rand(1..20), view_count: 0)

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
