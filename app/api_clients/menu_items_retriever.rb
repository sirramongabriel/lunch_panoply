require 'net/http'
require 'open-uri'

module MenuItemsRetriever
  def retrieve
    # Set request URL
    url = 'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352'

    # Set the request authentication headers
    headers = {
                'Accept:' => 'application/json; version=2',
                'X-HASTY-API-KEY:' => "#{ENV['X-HASTY-API-KEY']}"
              }

    # Send GET request
    response = open(url, headers).read
  end
end
