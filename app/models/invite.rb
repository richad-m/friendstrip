class Invite < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  attr_accessor :email
end
