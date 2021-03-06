class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :invites
  has_many :trips
  has_many :propositions
  has_many :votes

  has_one_attached :avatar
  validates :first_name, presence: true
end
