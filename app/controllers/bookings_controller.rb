class BookingsController < ApplicationController
  def new
    @service = Service.find(params[:service_id])
    @booking = Booking.new(service: @service,
                           user: current_user)
  end

  def create
    @service = Service.find(params[:service_id])
    @amount = booking_params[:num_songs] * @service.rate
    @booking = Booking.new(service: @service,
                           user: current_user,
                           amount: @amount,
                           num_songs: booking_params[:num_songs],
                           booking_date: booking_params[:booking_date])
    @booking.save!
    redirect_to bookings_path
  end

  def index
    if current_user.user_type == "Event host"
      @event_host_bookings = Booking.where(user: current_user)
    else
      @artist_bookings = current_user.bookings
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:num_songs, :booking_date)
  end
end
