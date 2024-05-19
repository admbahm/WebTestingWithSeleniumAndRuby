require 'spec_helper'

describe 'Wikipedia Main Page' do
  it 'should search for a query' do
    main_page = WikipediaMainPage.new(driver)
    search_results_page = WikipediaSearchResultsPage.new(driver)

    main_page.open
    main_page.search_for('Selenium (software)')
    expect(search_results_page.title).to eql('Selenium (software) - Wikipedia')
  end
end
