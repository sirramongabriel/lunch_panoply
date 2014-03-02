require 'vcr'

VCR.configure do |config|
  # the dir where your cassettes are saved
  config.cassette_library_dir = Rails.root.join("spec", "vcr")

  # my HTTP request service
  config.hook_into :faraday

  # add debugger
  config.debug_logger
end
