 # This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
# require 'rspec/autorun'
require 'fakeweb'
# require 'webmock/rspec'
require 'factory_girl_rails'
require 'shoulda'
require 'shoulda-matchers'
require 'faraday'
require 'vcr'


Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

FakeWeb.allow_net_connect = false

VCR.configure do |c|
  c.cassette_library_dir = 'vcr/cassettes'
  c.hook_into :fakeweb
  c.default_cassette_options = { record: :once }
  c.debug_logger = File.open(ARGV.first, 'w')
end

VCR.use_cassette('localhost') do
  # Net::HTTP.get_response('localhost', '/', 7777)
    conn = Faraday.new(url: 'http://devapi.zesty.com') do |c|
      c.use Faraday::Request::UrlEncoded
      c.use Faraday::Response::Logger
      c.use Faraday::Adapter::NetHttp
    end

    response = conn.get(
                          '/restaurants?latitude=37.7597272&longitude=-122.418352',
                          { },
                          { "Accept" => 'application/json; version=2', "X-HASTY-API-KEY" => ENV['X-HASTY-API-KEY']  }
                       )

    payload = JSON.parse(response.body, symbolize_names: true)
    payload[:dishes]

  response.body
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  # database_cleaner config
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # Fakeweb config
  config.before(:each) do
    FakeWeb.clean_registry
  end

  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
