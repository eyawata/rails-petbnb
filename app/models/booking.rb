class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  enum status: %i[active completed]
end
