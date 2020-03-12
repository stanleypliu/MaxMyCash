class UsersController < ApplicationController
  def dashboard
    @listings = current_user.listings
    @bookings = current_user.bookings
    @my_bookings = current_user.requested_bookings
    if params[:paid].present?
      @paidalert = true
    end
  end
end
