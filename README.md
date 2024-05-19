# MySeleniumProject

This project uses Selenium and RSpec for end-to-end testing of the Wikipedia main page with the Page Object Model.

## Prerequisites

- Ruby
- Bundler
- ChromeDriver

## Setup

1. Clone the repository:

    ```sh
    git clone https://github.com/your-username/MySeleniumProject.git
    cd MySeleniumProject
    ```

2. Install the dependencies:

    ```sh
    bundle install
    ```

3. Update the ChromeDriver path in `config/selenium_config.rb`. -> this project uses msedge

## Running Tests

- To run the tests:

    ```sh
    rake
    ```

## Project Structure

- `config/`: Configuration files
- `lib/page_objects/`: Page object classes
- `spec/`: Test files
