class TestController < ApplicationController



  def index
    require "dotenv/load" # allows you to pull in ENV vars
    require "http"
    require "json"

    polygon_api_key = ENV.fetch("POLYGON_API_KEY")

    # Polygon sample request
    # @output = HTTP.get("https://api.polygon.io/v3/reference/dividends?apiKey=#{polygon_api_key}").to_s

    # Daily Market Summary request
    # @output = HTTP.get("https://api.polygon.io/v2/aggs/grouped/locale/us/market/stocks/2025-03-12?adjusted=true&apiKey=#{polygon_api_key}")

    # Custom Bars request
    # @output = HTTP.get("https://api.polygon.io/v2/aggs/ticker/SHOP/range/1/day/2025-01-09/2025-02-10?adjusted=true&sort=asc&limit=120&apiKey=#{polygon_api_key}")

    # Previous Day Bar request
    # @output = HTTP.get("https://api.polygon.io/v2/aggs/ticker/SHOP/prev?adjusted=true&apiKey=#{polygon_api_key}")

    @shop_raw = HTTP.get("https://api.polygon.io/v2/aggs/ticker/SHOP/prev?adjusted=true&apiKey=#{polygon_api_key}")

    @cava_raw = HTTP.get("https://api.polygon.io/v2/aggs/ticker/CAVA/prev?adjusted=true&apiKey=#{polygon_api_key}")

    


  end

end
