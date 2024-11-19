class Owner::BookingsController < ApplicationController
  def index
    @owner = current_user
    @bookings_as_owner = @owner.bookings
  end
end
