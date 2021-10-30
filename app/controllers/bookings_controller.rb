require 'date'
class BookingsController < ApplicationController
  before_action :add_index_breadcrumb, only: [:show, :new, :edit]

  def new
    @service = Service.find(params[:service_id])
    @booking = Booking.new
    add_breadcrumb("New")
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
    add_breadcrumb("My bookings")
  end

  def show
    @booking = Booking.find(params[:id])
    @booking_date = @booking.booking_date.strftime('%a %d %b %Y')
    add_breadcrumb(artist_name_or_genre)
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

  def add_index_breadcrumb
    add_breadcrumb("My bookings", bookings_path)
  end

  def artist_name_or_genre
    @booking = Booking.find(params[:id])
    if @booking.user == current_user
      return @booking.service.user.name
    else
      return @booking.service.name
    end
  end

end
