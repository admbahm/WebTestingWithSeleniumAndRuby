class BasePage
  def initialize(driver)
    @driver = driver
  end

  def visit(url)
    @driver.navigate.to url
  end
end
