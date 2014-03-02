VCR.configure do |config|
  # the dir where your cassettes are saved
  config.cassette_library_dir = 'spec/vcr'

  # my HTTP request service
  config.hook_into :webmock
end
