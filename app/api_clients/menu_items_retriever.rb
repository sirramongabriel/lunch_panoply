require 'net/http'
require 'uri'
require 'open-uri'
require 'httparty'
require 'faraday'

module MenuItemsRetriever
  include HTTParty

  def MenuItemsRetriever.all_meals
    request = Faraday.get(
                            'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352',
                            { },
                            { 'Accept' => "application/json; version=2", 'X-HASTY-API-KEY' => ENV['X-HASTY-API-KEY'] }
                          )
   data = JSON.parse(request.body, opts = { symbolize_names: true })
   data[:dishes]
  end

  def MenuItemsRetriever.gluten_free
    # Set request URL
    response = HTTParty.get('http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352')
    puts response.body, response.code, response.message, response.headers.inspect

    # # Set the request authentication headers
    # headers = {
    #             'Accept' => "application/json; version=2",
    #             'X-HASTY-API-KEY' => "#{ENV['X-HASTY-API-KEY']}"
    #           }

    # # Send GET request
    # json = open(url, headers).read

    # data = JSON.parse(json)
    # data['dishes']
  end
end
