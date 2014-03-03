# require 'vcr'
# require 'json'

# VCR.configure do |c|
#   c.cassette_library_dir = 'vcr/cassettes'
#   c.hook_into :fakeweb
#   c.default_cassette_options = { record: :once }
#   c.debug_logger
# end

# VCR.use_cassette('localhost') do
#   # Net::HTTP.get_response('localhost', '/', 7777)
#     conn = Faraday.new(url: 'http://devapi.zesty.com') do |c|
#       c.use Faraday::Request::UrlEncoded
#       c.use Faraday::Response::Logger
#       c.use Faraday::Adapter::NetHttp
#     end

#     response = conn.get(
#                           '/restaurants?latitude=37.7597272&longitude=-122.418352',
#                           { },
#                           { "Accept" => 'application/json; version=2', "X-HASTY-API-KEY" => ENV['X-HASTY-API-KEY']  }
#                        )

#     payload = JSON.parse(response.body, symbolize_names: true)
#     payload[:dishes]

#   response.body
# end
