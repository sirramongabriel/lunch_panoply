# # start_sinatra_app(:port => 7777) do
# #   get('/') { "Hello" }
# # end

# require 'vcr'

# VCR.configure do |c|
#   c.cassette_library_dir = 'vcr/cassettes'
#   c.hook_into :webmock
# end

# VCR.use_cassette('localhost') do
#   Net::HTTP.get_response('localhost', '/', 7777)
# end
