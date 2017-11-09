class Answer < ApplicationRecord
  belongs_to :joke
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end
