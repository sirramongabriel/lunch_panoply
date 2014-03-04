 # This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
# require 'rspec/autorun'
# require 'fakeweb'
require 'webmock/rspec'
require 'factory_girl_rails'
require 'shoulda'
require 'shoulda-matchers'
require 'faraday'
# require 'vcr'



Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  # config.before(:each) do
  #   stub_request(:get, 'http://devapi.zesty.com/restaurants?latitude=37.7597272&longitude=-122.418352').
  #     with(headers: { 'Accept' => 'application/json; version=2' }).
  #       to_return(status: 200, body: "stubbed response", headers: { })
  # end

  config.include FactoryGirl::Syntax::Methods
  config.include JsonSpec::Helpers

  # WebMock
  config.include WebMock::API
  WebMock.disable_net_connect! allow_localhost: true

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
  # config.before(:each) do
  #   FakeWeb.clean_registry
  # end

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
