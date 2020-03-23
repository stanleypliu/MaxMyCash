class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
  end

  def payment
    @listing = Booking.find(params[:booking]).listing
    @client_secret = params[:client_secret]
  end


end
