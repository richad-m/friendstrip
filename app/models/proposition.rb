class Proposition < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  ICONS = {
    "food" => "fa-hamburger",
    "activity" => "fa-volleyball-ball",
    "accomodation" => "fa-bed"}
end
