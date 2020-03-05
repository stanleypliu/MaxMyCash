require 'json'
require 'open-uri'

class Listing < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :currency_amount, presence: true
  validates :currency, presence: true
  validates :location, presence: true
  validates :message, length: { minimum: 20 }

  def self.get_currencies
    # url = 'https://openexchangerates.org/api/currencies.json'
    url = 'https://gist.githubusercontent.com/Fluidbyte/2973986/raw/8bb35718d0c90fdacb388961c98b8d56abc392c9/Common-Currency.json'

    currencies_serialized = open(url).read
    currencies = JSON.parse(currencies_serialized)

    parsed_currencies = currencies.to_a.map do |currency|
      currency = "#{currency[1]["symbol"]} - #{currency[1]["name"]}"
    end
  end

  def self.exchange_value
    url = 'https://gist.githubusercontent.com/Fluidbyte/2973986/raw/8bb35718d0c90fdacb388961c98b8d56abc392c9/Common-Currency.json'

    currencies_serialized = open(url).read

    currency_symbols = []
    JSON.parse(currencies_serialized).each do |currency|
      currency_symbols << currency[1]["code"]
    end

    # currency_symbols
    # fixer's base currency is EUR
    response = HTTP.get("http://data.fixer.io/api/latest?access_key=#{ENV["FIXER_KEY"]}").to_s
    parsed_response = JSON.parse(response)
    # selected_rate = parsed_response["rates"].to_a.find { |rate| rate[1] == selectedrate }

    # selected_rate[1].to_i * currency_amount to get amount of euros
    # then multiply by gbp to euro exchange rate to get final value
  end

end




