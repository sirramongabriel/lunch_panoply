require 'net/http'
require 'open-uri'

module MenuItemsRetriever
  # Implements adapter pattern

  def send_request
    uri = URI.parse(
                      "-H 'Accept: application/json; version=2', 
                      -H '#{ ENV['X-HASTY-API-KEY'] }', 
                      http://devapi.zesty.com/restaurants?latidue37.7597272&longitude=-122.418352"
                    )
    "Hello world"
  end

  # def headers
    
  # end

  def get_response

  end



  private

  def uri
    uri = URI(
                "-H 'Accept: application/json; version=2', 
                -H '#{ ENV['X-HASTY-API-KEY'] }', 
                http://devapi.zesty.com/restaurants?latidue37.7597272&longitude=-122.418352"
              )
  end

  def key
    ENV['X-HASTY-API-KEY']
  end
end
