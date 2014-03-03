require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr/cassettes'
  c.hook_into :fakeweb
  c.default_cassette_options = { record: :once }
end

VCR.use_cassette('localhost') do
  # Net::HTTP.get_response('localhost', '/', 7777)
  conn = Faraday.new(url: 'http://localhost') do |faraday|
    faraday.request :url_encoded
    faraday.response :logger
    faraday.adapter Faraday.default_adapter
  end

  response = conn.get('/7777')
  response.body
end
