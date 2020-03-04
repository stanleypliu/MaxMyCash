class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  has_one :chatroom
end
