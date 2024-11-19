class BookingsController < ApplicationController
  def index
  end

  def create
    @booking = Booking.new(booking_params)

    start_date = DateTime.parse(params[:booking][:start_date])
    end_date = DateTime.parse(params[:booking][:end_date])
    pet_price = Pet.find(params[:pet_id]).price

    @booking.user = User.last
    @booking.start_date = start_date
    @booking.end_date = end_date
    @booking.pet = Pet.find(params[:pet_id])
    @booking.total_price = pet_price * (end_date - start_date)

    if @booking.save
      redirect_to bookings_path
    else
      render "", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:pet, :user, :start_date, :end_date)
  end
end
