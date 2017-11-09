class Joke < ApplicationRecord
  has_many :answers
  belongs_to :best_answer, class_name: "Answer"
  has_many :votes, as: :votable
  belongs_to :user
  has_many :comments, as: :commentable

end
