class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @booking = @chatroom.booking
    @message = Message.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    # this is so there is only one chat per booking preventing a new chat everytime message is clicked
    if @booking.chatroom.nil?
      @chatroom = Chatroom.create(booking: @booking)
    else
      @chatroom = @booking.chatroom
    end
    redirect_to booking_chatrooms_path(@booking, @chatroom)
  end
end
