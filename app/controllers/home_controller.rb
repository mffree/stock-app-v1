class HomeController < ApplicationController



  def index
    require "dotenv/load" # allows you to pull in ENV vars
    require "http"
    require "json"

    polygon_api_key = ENV.fetch("POLYGON_API_KEY")

    @shop_raw = HTTP.get("https://api.polygon.io/v2/aggs/ticker/SHOP/prev?adjusted=true&apiKey=#{polygon_api_key}")

    @cava_raw = HTTP.get("https://api.polygon.io/v2/aggs/ticker/CAVA/prev?adjusted=true&apiKey=#{polygon_api_key}")

    #  Previous Day Bar output 
    # {"ticker":"SHOP","queryCount":1,"resultsCount":1,"adjusted":true,"results":[{"T":"SHOP","v":1.1018657e+07,"vw":91.2429,"o":95.17,"c":90.59,"h":95.53,"l":89.1,"t":1741896000000,"n":134600}],"status":"OK","request_id":"d0e92d840267a4849f281ac40241c54c","count":1} 

    @shop_parsed = JSON.parse(@shop_raw)

    @shop_details = @shop_parsed.fetch("results")[0]

    @shop_ticker = @shop_details.fetch("T")
    @shop_date_raw = @shop_details.fetch("t")
    @shop_date = Time.at(@shop_date_raw/1000).strftime("%m-%d-%Y") # Dividing by 1000 because the time is given in Unix milliseconds
    @shop_close = @shop_details.fetch("c")

    


  end

end
