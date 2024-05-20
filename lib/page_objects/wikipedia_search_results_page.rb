require_relative 'base_page'

class WikipediaSearchResultsPage < BasePage

  def initialize(driver)
    super(driver)
  end
  
  def title
    @driver.title
  end
end

# # WikipediaSeleniumSearchResultsPage
#   def count_selenium_occurrences
#     text = @driver.find_element(:tag_name, 'body').text
#     text.downcase.scan(/selenium/).length
#   end
# end