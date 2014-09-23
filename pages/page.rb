class Page
 
  def initialize(driver)
    @driver = driver
  end

  def load(path)
    @driver.get ENV['base_url'] + path
  end

  def wait_until(seconds=5) 
    Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
  end

  def find(locator) 
    wait_until { @driver.find_element(locator) }
  end

  def find_within(context, locator) 
    wait_until { @driver.find_element(context).find_element(locator) }
  end

  def title
    wait_until { @driver.title }
  end

  def text_include(text, locator)
    find(locator).text.include?(text)
  end

  def enter(text, locator)
    find(locator).send_keys text
  end

  def click(locator) 
    find(locator).click
  end

  def click_within(context, locator) 
    find_within(context, locator).click
  end

  def submit(locator) 
    find(locator).submit
  end

  def is_displayed?(locator) 
    begin
      find(locator).displayed?
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
    end
  end

  def ui_element_displayed?(ui_element)
    is_displayed? ui_element
  end
  
end # Page
