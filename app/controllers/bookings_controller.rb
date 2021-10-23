class BookingsController < ApplicationController
  def new
    @service = Service.find(params[:service_id])

    @booking = Booking.new(service: @service,
                           user: current_user,
                           booking_date: params[:booking_date])
  end

  def create
    @booking = Booking.new(service: params[:service],
                           user: current_user,
                           booking_date: params[:booking_date])
    @booking.save!
    redirect_to bookings_path
  end

  def index

  end
end
