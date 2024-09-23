# lib/latest_stock_price.rb
require 'net/http'
require 'json'

class LatestStockPrice
  BASE_URL = "https://api.example.com/latest-stock-price" # Ganti dengan URL yang sesuai

  def self.price(stock_symbol)
    uri = URI("#{BASE_URL}/#{stock_symbol}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def self.prices(stock_symbols)
    stock_symbols.map { |symbol| price(symbol) }
  end

  def self.price_all
    # Implementasi untuk mendapatkan semua harga saham
  end
end
