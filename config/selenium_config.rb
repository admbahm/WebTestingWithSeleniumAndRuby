require 'selenium-webdriver'

def setup
  Selenium::WebDriver::Edge::Service.driver_path = '/usr/local/bin/msedgedriver'
  options = Selenium::WebDriver::Edge::Options.new
  # options.add_argument('--headless') # Optional, run in headless mode
  @driver = Selenium::WebDriver.for :edge, options: options
end

def teardown
  @driver.quit
end

def driver
  @driver
end

