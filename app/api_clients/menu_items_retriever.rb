require 'net/http'
require 'open-uri'

module MenuItemsRetriever
  def MenuItemsRetriever.all_meals
    # Set request URL

    # Set the request authentication headers

    # Send GET request
  end

  def MenuItemsRetriever.gluten_free
    # Set request URL
    url = 'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352'

    # Set the request authentication headers
    headers = {
                'Accept' => "application/json; version=2",
                'X-HASTY-API-KEY' => "#{ENV['X-HASTY-API-KEY']}"
              }

    # Send GET request
    json = open(url, headers).read

    data = JSON.parse(json)
    data['dishes']
  end
end
