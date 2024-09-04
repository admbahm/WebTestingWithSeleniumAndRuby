require 'spec_helper'

describe 'Wikipedia Main Page' do
  let(:main_page) { WikipediaMainPage.new(driver) }
  let(:search_results_page) { WikipediaSearchResultsPage.new(driver) }

  it 'should search for a query' do
    main_page.open
    main_page.search_for('Selenium (software)')

    expect(search_results_page.title).to eql('Selenium (software) - Wikipedia')
  end

  it 'should select English language' do
    main_page.open
    main_page.select_language('English')

    expect(driver.current_url).to include('en.wikipedia.org')
  end

  it 'should count occurrences of "selenium" on the search results page' do
    selenium_results_page = WikipediaSeleniumSearchResultsPage.new(driver)

    main_page.open
    main_page.search_for('Selenium (software)')

    selenium_count = selenium_results_page.count_selenium_occurrences
    expect(selenium_count).to be > 0
  end
end


# require 'spec_helper'
#
# describe 'Wikipedia Main Page' do
#   it 'should search for a query' do
#     # Arrange
#     main_page = WikipediaMainPage.new(driver)
#     search_results_page = WikipediaSearchResultsPage.new(driver)
#
#     # Act
#     main_page.open
#     main_page.search_for('Selenium (software)')
#
#     # Assert
#     expect(search_results_page.title).to eql('Selenium (software) - Wikipedia')
#   end # closes the it line
#
#   # Explanation
# # Arrange
# # This section sets up the necessary objects and state before the action is performed. It includes initializing the main_page and search_results_page objects.
#
# # Act
# # This section performs the action being tested. It includes opening the Wikipedia main page and performing the search for 'Selenium (software)'.
#
# # Assert
# # This section verifies the result of the action. It includes checking that the title of the search results page matches the expected value.
#
#   it 'select English language' do
#     # Arrange: Initialize the WikipediaMainPage object with the WebDriver instance.
#     main_page = WikipediaMainPage.new(@driver)
#
#     # Act: Open the Wikipedia main page and select the English language.
#     main_page.open
#     main_page.select_language('English')
#
#     # Assert: Verify that the current URL includes 'en.wikipedia.org', indicating that
#     # the page has navigated to the English version of Wikipedia.
#     expect(@driver.current_url).to include('en.wikipedia.org')
#   end
#
#
# end # closes the describe line and test object
#
#
#
#
# # describe 'Wikipedia Main Page' do
# #   # ... (previous search test)
#
# #   it 'should count occurrences of "selenium" on the search results page' do
# #     main_page = WikipediaMainPage.new(driver)
# #     selenium_results_page = WikipediaSeleniumSearchResultsPage.new(driver)
#
# #     main_page.open
# #     main_page.search_for('Selenium (software)')
#
# #     selenium_count = selenium_results_page.count_selenium_occurrences
# #     expect(selenium_count).to be > 0  # Ensure at least one occurrence
# #   end
# # end
