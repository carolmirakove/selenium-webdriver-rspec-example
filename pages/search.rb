require_relative 'page'

class Search < Page

  SEARCH_INPUT_LOCATOR = { name: 'keys' }
  SEARCH_SUBMIT_BUTTON_LOCATOR = { name: 'op' }
  ADVANCED_SEARCH_LINK_LOCATOR = { partial_link_text: 'Advanced search' }
  PAGE_CONTENT_LOCATOR = { css: 'div#content' }
  
  def ui_elements
    yield SEARCH_INPUT_LOCATOR
    yield SEARCH_SUBMIT_BUTTON_LOCATOR
    yield ADVANCED_SEARCH_LINK_LOCATOR
    yield PAGE_CONTENT_LOCATOR
  end

  def no_results_displayed?
    text_include 'Your search yielded no results', PAGE_CONTENT_LOCATOR
  end
end # Search
