# SeleniumWithRuby

This project utilizes Selenium WebDriver and RSpec for end-to-end testing of the Wikipedia main page, implementing the Page Object Model (POM) design pattern for better maintainability and readability of test scripts.

## Prerequisites

Before you begin, ensure you have the following software installed on your system:

- **Ruby**: Ensure Ruby is installed on your machine. You can download it from [Ruby's official site](https://www.ruby-lang.org/en/downloads/).
- **Bundler**: Bundler manages gem dependencies for your Ruby projects. Install it using:
    ```sh
    gem install bundler
    ```
- **MsEdgedriver**: Download the Microsoft Edge WebDriver that matches your Edge browser version from [Microsoft Edge WebDriver](https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/).

## Setup

Follow these steps to set up the project on your local machine:

1. **Clone the repository:**

    ```sh
    git clone git@github.com:admbahm/WebTestingWithSeleniumAndRuby.git
    cd WebTestingWithSeleniumAndRuby
    ```

2. **Install the dependencies:**

    ```sh
    bundle install
    ```

3. **Configure MsEdgedriver:**

   Update the MsEdgedriver path in `config/selenium_config.rb`. Ensure the path points to where you downloaded and extracted the MsEdgedriver binary.

## Running Tests

To execute the test suite, use the following command:

```sh
rake
```

### Running Individual Tests

#### Run a Specific Test File

You can run a specific test file by providing the file path to the `rspec` command:

```sh
bundle exec rspec spec/api/wikipedia_api_spec.rb
```

#### Run a Specific Test Example

To run a specific test example within a file, use the `--example` or `-e` flag followed by the description of the test:

```sh
bundle exec rspec spec/api/wikipedia_api_spec.rb -e "should return a 200 status code for a valid query"
```

#### Run Tests by Line Number

You can run a specific test by specifying the line number where the test is defined:

```sh
bundle exec rspec spec/api/wikipedia_api_spec.rb:10
```

#### Tagging Tests

RSpec supports tagging tests so you can run a specific subset of tests. Here's how to use tags:

##### Tagging a Test

In your test file, you can add tags to tests or groups of tests:

```ruby
# spec/api/wikipedia_api_spec.rb
describe 'Wikipedia API', :api do
  it 'should return a 200 status code for a valid query', :smoke do
    # Test implementation
  end

  it 'should return search results for a valid query', :regression do
    # Test implementation
  end
end
```

##### Running Tagged Tests

You can run tests with a specific tag using the `--tag` option:

```sh
bundle exec rspec --tag api
bundle exec rspec --tag smoke
```

## Project Structure

The repository is organized as follows:

- **`config/`**: Contains configuration files, including Selenium WebDriver configurations.
- **`lib/page_objects/`**: Holds the Page Object classes which encapsulate the web elements and actions performed on the web pages.
- **`spec/`**: Contains the RSpec test files which define the test cases.

## Writing Tests

Here's an example structure of a test case:

1. **Page Object Class (WikipediaMainPage)**

    ```ruby
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
    ```

2. **Test Spec (wikipedia_main_page_spec.rb)**

    ```ruby
    require 'spec_helper'

    describe 'Wikipedia Main Page' do
      it 'should search for a query' do
        # Arrange
        main_page = WikipediaMainPage.new(@driver)
        search_results_page = WikipediaSearchResultsPage.new(@driver)

        # Act
        main_page.open
        main_page.search_for('Selenium (software)')

        # Assert
        expect(search_results_page.title).to eql('Selenium (software) - Wikipedia')
      end
    end
    ```

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -am 'Add new feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries or issues, please open an issue on the repository or contact the repository owner.
