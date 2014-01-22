  # factory_girl configs
  Rails.application.config.generators do |g|
    g.test_framework  :rspec, 
                      fixtures: true,
                      view_specs: false,
                      helper_specs: false, # consider changing to true in the future
                      routing_specs: false, # consider changing to true in the future
                      controller_specs: true,
                      request_specs: false

    g.fixture_replacement :factory_girl, dir: "spec/factories"
  end
