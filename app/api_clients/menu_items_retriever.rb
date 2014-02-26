require 'net/http'
require 'open-uri'
require 'pp'

module MenuItemsRetriever
  def MenuItemsRetriever.retrieve_flickr
    # Set request URL
    url = 'https://api.flickr.com/services/rest/'

    # Set the request headers
    headers = {
                'Key:' => ENV['key'],
                'Secret:' => ENV['secret'] 
              }

    # Send GET request
    response = open(url, headers).read

    puts response.body
  end

  def MenuItemsRetriever.retrieve_zesty
    # Set reqeust URL
    uri = URI("http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352")


    # Set request headers
    headers = {
                'Accept:' => "application/json; version=2",
                'X-HASTY-API-KEY:' => "#{ENV['X-HASTY-API-KEY']}"
              }

    # Send GET request
    # response = open(uri, headers).read
    response = Net::HTTP.post_form(uri, 'q' => 'dishes', 'max' => '55')
    puts response.body

    ###

    # # Set request URL
    # url = 'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352'

    # # Set the request authentication headers
    # headers = {
    #             'Accept:' => "application/json; version=2",
    #             'X-HASTY-API-KEY:' => "#{ENV['X-HASTY-API-KEY']}"
    #           }

    # # Send GET request
    # response = open(url, headers).read
  end
end
