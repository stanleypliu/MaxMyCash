class Chatroom < ApplicationRecord
  belongs_to :booking, dependent: :destroy
  has_many :messages, dependent: :destroy
end
