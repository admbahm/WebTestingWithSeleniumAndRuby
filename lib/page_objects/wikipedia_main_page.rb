require_relative 'base_page'  # Require the base page class which provides common functionality for all page objects

class WikipediaMainPage < BasePage
  # Define constants for the search input field, search button, and language link
  SEARCH_INPUT = { id: 'searchInput' }
  SEARCH_BUTTON = { css: 'button[type="submit"]' }
  LANGUAGE_LINK = { css: 'a#js-link-box-en' } # Adjust the selector as necessary

  # Initialize method for setting up the driver and URL
  def initialize(driver)
    super(driver)  # Call the initializer of the parent class (BasePage)
    @url = 'https://www.wikipedia.org/'  # Set the URL for the Wikipedia main page
  end

  # Method to open the Wikipedia main page
  def open
    visit(@url)  # Use the visit method from BasePage to navigate to the URL
  end

  # Method to perform a search on the Wikipedia main page
  def search_for(query)
    @driver.find_element(SEARCH_INPUT).send_keys(query)  # Find the search input field and enter the query
    @driver.find_element(SEARCH_BUTTON).click  # Find the search button and click it to submit the search
  end

  # Method to select the English language on the Wikipedia main page
  def select_language(language = 'English')
    @driver.find_element(LANGUAGE_LINK).click  # Find the language link element and click it
  end
end

# Explanation of Comments
# Require Statement:

# require_relative 'base_page': Includes the base page class which contains common methods and properties shared by all page objects.
# Class Definition:

# class WikipediaMainPage < BasePage: Defines the WikipediaMainPage class which inherits from BasePage.
# Constants:

# SEARCH_INPUT, SEARCH_BUTTON, and LANGUAGE_LINK: These constants store the locators for the search input field, search button, and language link, respectively.
# Initialize Method:

# def initialize(driver): Constructor method that initializes the page object with the WebDriver instance.
# super(driver): Calls the constructor of the parent class BasePage.
# @url: Sets the URL of the Wikipedia main page.
# Open Method:

# def open: Defines a method to navigate to the Wikipedia main page.
# visit(@url): Uses the visit method from BasePage to open the specified URL.
# Search Method:

# def search_for(query): Defines a method to perform a search.
# @driver.find_element(SEARCH_INPUT).send_keys(query): Finds the search input field and types the query.
# @driver.find_element(SEARCH_BUTTON).click: Finds and clicks the search button.
# Select Language Method:

# def select_language(language = 'English'): Defines a method to select the English language (default) on the main page.
# @driver.find_element(LANGUAGE_LINK).click: Finds and clicks the language link.
