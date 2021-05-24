class Trip < ApplicationRecord
  belongs_to :user
  has_many :propositions
  has_many :invites
end
