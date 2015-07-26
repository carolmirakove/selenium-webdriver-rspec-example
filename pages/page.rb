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
    begin 
      wait_until { @driver.find_element(locator) }
    rescue Selenium::WebDriver::Error::TimeOutError
      wait_until { @driver.find_element(locator) }
    end
  end

  def find_within(context, locator) 
    wait_until { @driver.find_element(context).find_element(locator) }
  end

  def get_text(locator) 
    wait_until { @driver.find_element(locator).text }
  end

  def text_include(text, locator)
    find(locator).text.include?(text)
  end

  def title
    wait_until { @driver.title }
  end

  def click(locator) 
    find(locator).click
  end

  def click_within(context, locator) 
    find_within(context, locator).click
  end

  def enter(text, locator)
    find(locator).send_keys text
  end

  def hover_over(locator)
    @driver.action.move_to(find(locator)).perform
  end

  def submit(locator) 
    find(locator).submit
  end

  def is_displayed?(locator) 
    begin
      find(locator).displayed?
    rescue Selenium::WebDriver::Error::TimeOutError
      return false
      raise 'Element not displayed'
    else
      return true      
    end
  end

  def is_not_displayed?(locator)
    begin
      find(locator).displayed?
    rescue Selenium::WebDriver::Error::TimeOutError
      return true
    else
      return false
      raise 'Element was present'
    end
  end

  def ui_element_displayed?(ui_element)
    is_displayed? ui_element
  end
  
  def generate_timestamp
    timestamp = Time.now.strftime('%m%d%Y%H%M%S')
    return timestamp
  end
end # Page
