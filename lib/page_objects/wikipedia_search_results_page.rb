require_relative 'base_page'

class WikipediaSearchResultsPage < BasePage
  def title
    @driver.title
  end
end
