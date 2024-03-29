class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    if params[:where].present?
      if params[:distance] == ""
        @listings = Listing.near(params[:where], 0)
      else
        @listings = Listing.near(params[:where], params[:distance])
      end
      if params[:query].present?
        @listings = @listings.where("currency ILIKE? ", "%#{params[:query]}%")
      end
    else
      # @listings = Listing.take(8)
      @listings = Listing.all.sort_by { |listing| listing.created_at }.reverse! # having it sort by most recently made
    end
    @markers = @listings.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { listing: listing }),
        image_url: helpers.asset_url('yen.png')
      }
    end
    @pagy_a, @loaded_listings = pagy_array(@listings)
  
    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: "listings", formats: [:html]), pagination: view_context.pagy_nav(@pagy_a) }
      }
    end
  end
  
  def show
    @listing = Listing.find(params[:id])
    @user = @listing.user
    @reviews = @user.received_reviews
  end

  def new
    @currencies = Listing.get_currencies
    # page where the form is displayed
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    @listing.transaction_completed = false
    if @listing.save
      redirect_to dashboard_path
    else
      flash.alert = "Please check your form for any errors and try again."
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