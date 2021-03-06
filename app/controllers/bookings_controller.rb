require 'date'
class BookingsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @service = Service.find(params[:service_id])
    @booking.service = @service
    @amount = @booking.num_songs * @service.rate
    @booking.amount = @amount
    @booking.user = current_user
    # raise
    @booking.save!
    redirect_to bookings_path
  end

  def index
    if current_user.user_type == "Event host"
      @event_host_bookings = Booking.where(user: current_user)
    else
      @artist_bookings = Booking.joins(:service).where("services.user_id = ?", current_user.id)
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @booking_date = @booking.booking_date.strftime('%a %d %b %Y')
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:num_songs, :booking_date)
  end
end
