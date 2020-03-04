require 'json'
require 'open-uri'

class Listing < ApplicationRecord
  has_many :bookings
  belongs_to :user

  def self.get_currencies
    # url = 'https://openexchangerates.org/api/currencies.json'
    url = 'https://gist.githubusercontent.com/Fluidbyte/2973986/raw/8bb35718d0c90fdacb388961c98b8d56abc392c9/Common-Currency.json'

    currencies_serialized = open(url).read
    currencies = JSON.parse(currencies_serialized)

    parsed_currencies = currencies.to_a.map do |currency|
      currency = "#{currency[1]["symbol"]} - #{currency[1]["name"]}"
    end
  end

end




