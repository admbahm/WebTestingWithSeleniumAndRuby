require 'spec_helper'

describe 'Wikipedia Main Page' do
  it 'should search for a query' do
    # Arrange
    main_page = WikipediaMainPage.new(driver)
    search_results_page = WikipediaSearchResultsPage.new(driver)

    # Act
    main_page.open
    main_page.search_for('Selenium (software)')

    # Assert
    expect(search_results_page.title).to eql('Selenium (software) - Wikipedia')
  end # closes the it line
end # closes the describe line

# Explanation
# Arrange
# This section sets up the necessary objects and state before the action is performed. It includes initializing the main_page and search_results_page objects.

# Act
# This section performs the action being tested. It includes opening the Wikipedia main page and performing the search for 'Selenium (software)'.

# Assert
# This section verifies the result of the action. It includes checking that the title of the search results page matches the expected value.


# describe 'Wikipedia Main Page' do
#   # ... (previous search test)

#   it 'should count occurrences of "selenium" on the search results page' do
#     main_page = WikipediaMainPage.new(driver)
#     selenium_results_page = WikipediaSeleniumSearchResultsPage.new(driver)

#     main_page.open
#     main_page.search_for('Selenium (software)')

#     selenium_count = selenium_results_page.count_selenium_occurrences
#     expect(selenium_count).to be > 0  # Ensure at least one occurrence
#   end
# end


