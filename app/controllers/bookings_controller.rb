class BookingsController < ApplicationController
  before_action :set_listing

  def index
    @bookings = Booking.where(user: params[:user_id])
    # @bookings = Booking.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  # def new
  # end

  def create
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

end
