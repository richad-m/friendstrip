class Proposition < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :category, :start_date, :end_date, :address, presence: true
  ICONS = {
    "food" => "fa-hamburger",
    "activity" => "fa-volleyball-ball",
    "accomodation" => "fa-bed"}
end
