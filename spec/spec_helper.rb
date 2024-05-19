require 'rspec'
require_relative '../config/selenium_config'
require_relative '../lib/page_objects/wikipedia_main_page'
require_relative '../lib/page_objects/wikipedia_search_results_page'

RSpec.configure do |config|
  config.before(:each) do
    setup
  end

  config.after(:each) do
    teardown
  end
end
