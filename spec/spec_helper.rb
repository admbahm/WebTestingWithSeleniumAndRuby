require 'rspec'
require_relative '../config/selenium_config'
require_relative '../lib/page_objects/wikipedia_main_page'
require_relative '../lib/page_objects/wikipedia_search_results_page'
Dir[File.join(__dir__, 'api', '**/*.rb')].each { |file| require file }

RSpec.configure do |config|
  config.before(:suite) do
    # Any setup needed before the entire test suite runs
  end

  config.before(:each) do
    setup  # Calls the setup method defined in selenium_config to initialize the WebDriver
  end

  config.after(:each) do
    teardown  # Calls the teardown method defined in selenium_config to quit the WebDriver
  end

  config.around(:each) do |example|
    example.run
  end

  config.after(:suite) do
    # Any cleanup needed after the entire test suite runs
  end

  # Enable color in the output
  config.color = true

  # Use the specified formatter
  config.formatter = :documentation

  # Include timing information
  config.profile_examples = 10
end

# ORIGINAL
# RSpec.configure do |config|
#   # This block runs before each individual test
#   config.before(:each) do
#     setup  # Calls the setup method defined in selenium_config to initialize the WebDriver
#   end
#
#   # This block runs after each individual test
#   config.after(:each) do
#     teardown  # Calls the teardown method defined in selenium_config to quit the WebDriver
#   end
#
#   config.around(:each) do |example|
#     start_time = Time.now
#     # This block runs around each individual test.
#     # You can add setup code before example.run and teardown code after example.run
#     # puts "Starting #{example.description}"
#     example.run  # This executes the actual test
#     end_time = Time.now
#     # Additional code can be added here to run after each test, if needed.
#     execution_time = end_time - start_time
#     # puts "Finished #{example.description}"
#     # puts "Execution time for #{example.description}: #{execution_time} seconds"
#   end
# end