class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings
  has_many :bookings
  has_many :requested_bookings, through: :listings, source: :bookings
  has_many :made_reviews, class_name: 'Review', foreign_key: 'reviewer_id'
  has_many :received_reviews, class_name: 'Review', foreign_key: 'reviewee_id'
  validates :first_name, presence: true
  validates :last_name, presence: true
end
