require 'rubygems'
require 'bundler'

Bundler.require(:test_frameworks, :test_harness, :libraries, :debugging)

RSpec.configure do |config|

  config.before(:each) do
    case ENV['browser'] || 'chrome'
    when 'firefox'
      @driver = Selenium::WebDriver.for :firefox
    when 'chrome'
      Selenium::WebDriver::Chrome::Service.executable_path = File.join(Dir.pwd, '/browser_drivers/chromedriver')
      @driver = Selenium::WebDriver.for :chrome
    end
  end

  config.before(:each) do
    @driver.manage.delete_all_cookies
  end

  config.after(:each) do
    @driver.quit
  end

end
