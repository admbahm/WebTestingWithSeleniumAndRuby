require_relative 'base_page'

class WikipediaMainPage < BasePage
  SEARCH_INPUT = { id: 'searchInput' }
  SEARCH_BUTTON = { css: 'button[type="submit"]' }

  def initialize(driver)
    super(driver)
    @url = 'https://www.wikipedia.org/'
  end

  def open
    visit(@url)
  end

  def search_for(query)
    @driver.find_element(SEARCH_INPUT).send_keys(query)
    @driver.find_element(SEARCH_BUTTON).click
  end
end
