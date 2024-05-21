require 'httparty'
require 'rspec'

describe 'Wikipedia API' do
  include HTTParty
  base_uri 'https://en.wikipedia.org/w/api.php'

  # Helper method to make API requests
  def make_request(params)
    self.class.get('', query: params)
  end

  it 'should return a 200 status code for a valid query' do
    # Arrange: Set up the query parameters
    params = { action: 'query', list: 'search', srsearch: 'Selenium (software)', format: 'json' }

    # Act: Make the API request
    response = make_request(params)

    # Assert: Validate the response status code
    expect(response.code).to eql(200)
  end

  it 'should return search results for a valid query' do
    # Arrange: Set up the query parameters
    params = { action: 'query', list: 'search', srsearch: 'Selenium (software)', format: 'json' }

    # Act: Make the API request
    response = make_request(params)

    # Assert: Validate the search results are not empty
    results = response.parsed_response['query']['search']
    expect(results).not_to be_empty
  end

  it 'should handle an invalid query gracefully' do
    # Arrange: Set up the query parameters with an invalid search term
    params = { action: 'query', list: 'search', srsearch: '', format: 'json' }

    # Act: Make the API request
    response = make_request(params)

    # Assert: Validate the response contains an error message
    error_message = response.parsed_response['error']
    expect(error_message).not_to be_nil
  end
end

# Explanation of the Code
# Setup:

# include HTTParty and base_uri: Include HTTParty and set the base URI for the Wikipedia API.
# Helper Method:

# make_request: A helper method to make GET requests with query parameters.
# Test Cases:

# Valid Query:
# Arrange: Set up query parameters for a valid search.
# Act: Make the API request.
# Assert: Check that the response status code is 200.
# Search Results:
# Arrange: Set up query parameters for a valid search.
# Act: Make the API request.
# Assert: Verify that the search results are not empty.
# Invalid Query:
# Arrange: Set up query parameters with an invalid search term.
# Act: Make the API request.
# Assert: Check for an error message in the response.
