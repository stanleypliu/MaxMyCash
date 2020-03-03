class BookingsController < ApplicationController
  before_action :set_listing

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new
    @booking.listing = @listing
    @booking.user = current_user
    if @booking.save
      redirect_to @booking
    else
      render 'listings/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

end
