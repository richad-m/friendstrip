class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :proposition
  validates :status, inclusion: {in: ["upvote", "downvote"]}
end
