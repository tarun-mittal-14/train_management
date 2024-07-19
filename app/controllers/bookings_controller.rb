class BookingsController < ApplicationController
  before_action :authenticate_user!


  def index
    @bookings = Booking.where(user_id: current_user.id)
  end
  
  def new
    @booking = Booking.new
    @train = Train.find(params[:train_id])
  end


  def create
    @train = Train.find(params[:train_id])
    seats_to_book = params[:booking][:seats].to_i
    if seats_to_book <= 0
      flash[:alert] = "Number of seats to book must be greater than zero."
    elsif seats_to_book > @train.seats
      flash[:alert] = "You can only book up to #{@train.seats} seats."
    else
      @train.seats -= seats_to_book
      @train.save
      Booking.create!(user: current_user, train: @train, seats: seats_to_book)
      flash[:notice] = "#{seats_to_book} seats successfully booked on #{@train.name}."
    end
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:seats)
  end
end



