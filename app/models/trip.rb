class Trip < ApplicationRecord
  belongs_to :user
  has_many :propositions, dependent: :destroy
  has_many :invites
  has_many :users, through: :invites

  validates :start_date, :end_date, :destination, presence: true
end
