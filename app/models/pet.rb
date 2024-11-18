class Pet < ApplicationRecord
  has_many :reviews
  has_many :bookings
  belongs_to :user
end
