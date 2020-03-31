require 'json'
require 'open-uri'

class Listing < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :currency_amount, presence: true
  validates :currency_amount, numericality: { only_integer: true, greater_than: 0 }
  validates :currency, presence: true
  validates :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_currency,
    against: [ :currency ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  pg_search_scope :search_by_location,
  against: [ :location ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  def self.get_currencies
    # url = 'https://openexchangerates.org/api/currencies.json'
    url = 'https://gist.githubusercontent.com/Fluidbyte/2973986/raw/8bb35718d0c90fdacb388961c98b8d56abc392c9/Common-Currency.json'

    currencies_serialized = open(url).read
    currencies = JSON.parse(currencies_serialized)

    parsed_currencies = currencies.to_a.map do |currency|
      currency = "#{currency[1]["code"]} - #{currency[1]["name"]}"
    end
  end
end




