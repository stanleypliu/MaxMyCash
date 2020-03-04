class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @listings = Listing.all
    @listings = Listing.where(transaction_completed: false)
    # raise
    #not complete because this needs a map as well
  end

  def show
    @listing = Listing.find(params[:id])
    @user = @listing.user
    @reviews = @user.received_reviews
  end

  def new
    # page where the form is displayed
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to listing_path(@listing)
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    redirect_to dashboard_path
  end

  private

  def listing_params
    params.require(:listing).permit(:currency_amount, :currency, :location, :message)
  end
end
