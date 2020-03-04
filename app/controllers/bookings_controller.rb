class BookingsController < ApplicationController
  before_action :set_listing, except: [:show, :destroy]

  # def index
  #   @bookings = Booking.where(user: current_user)
  # end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new
    @booking.listing = @listing
    @booking.user = current_user
   # @booking.listing.transaction_completed = true
    # raise
    if @booking.save
     # @booking.listing.save
      redirect_to booking_path(@booking)
    else
      render 'listings/show'
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.booking_status = true
    redirect_to dashboard_path
    @booking.save
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end
end
