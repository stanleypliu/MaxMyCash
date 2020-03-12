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

# def accept 
#     @booking = Booking.find(params[:id])
#     @booking.booking_status = true
#     @booking.save
#     redirect_to dashboard_path
# end 

  def update
    @booking = Booking.find(params[:id])
    @booking.booking_status = true
    @booking.save
    Stripe.api_key = 'sk_test_9aTAyyjRKyVdd42UfavEGGvo003cDs6Wl9'
    intent = Stripe::PaymentIntent.create({
      amount: @booking.listing.currency_amount,
      currency: @booking.listing.currency[0..2].downcase,
      # Verify your integration in this guide by including this parameter
      metadata: {integration_check: 'accept_a_payment'},
    })
    client_secret = intent.client_secret
<<<<<<< HEAD
    @booking.save
    redirect_to payment_path(client_secret: client_secret, booking: @booking)
=======
    redirect_to payment_path(client_secret: client_secret)
    # redirect_to dashboard_path
>>>>>>> 3beecf5b9b252feefb39f818c611c3e972613451
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
