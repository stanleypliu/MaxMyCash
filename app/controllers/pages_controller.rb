class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def payment
    @amount = booking.listing.amount
    @client_secret = params[:client_secret]
  end
end
