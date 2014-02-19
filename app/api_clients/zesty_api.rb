require 'net/http'
require 'open-uri'

# uri = URI(
#             "-H 'Accept: application/json; version=2',
#             'X-HASTY-API-KEY: efdb8f7f2fe9c47e34dfe1fb7c491d0638ec2d86',
#             http://devapi.zesty.com/restaurants?latidue37.7597272&longitude=-122.418352"
#          )

# response = Net::HTTP.get_response(uri)
api_base_url = 'http://devapi.zesty.com/restaurants'

uri = URI("#{ api_base_url }?latitude=37.7597272&longitude=-122.418352")
