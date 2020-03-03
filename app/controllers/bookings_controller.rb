class BookingsController < ApplicationController
  before_action :set_listing, except: :show

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
    @booking.listing.transaction_completed = true
    # raise
    if @booking.save
      @booking.listing.save
      redirect_to booking_path(@booking)
    else
      render 'listings/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  def accept_booking
    # if another user requests one of your bookings, to set transaction completed to true
    if
    # booking.transaction_completed = true
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end


end
