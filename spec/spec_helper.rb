require 'rubygems'
require 'bundler'
require 'rspec/retry'
require_relative '../lib/login_credentials'

Dir['./spec/helpers/**/*.rb'].each { |file| require file }

Bundler.require(:test_frameworks, :test_harness, :saucelabs, :libraries, :debugging)

RSpec.configure do |config|

  config.before(:each) do |example|
    case ENV['host']
    when 'saucelabs'
      caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
      caps.version = ENV['browser_version']
      caps.platform = ENV['operating_system']
      caps[:name] = example.metadata[:full_description]

      @driver = Selenium::WebDriver.for(
        :remote,
        url: "http://#{SAUCE_USERNAME}:#{SAUCE_ACCESS_KEY}@ondemand.saucelabs.com:80/wd/hub",
        desired_capabilities: caps)

    else
    # default browser is chrome; others can passed as variables 
      case ENV['browser'] ||= 'chrome'
      when 'chrome'
        @driver = Selenium::WebDriver.for :chrome
      when 'firefox'
        @driver = Selenium::WebDriver.for :firefox
      end
    end

    # default AUT is local; others can be passed as variables 
    case ENV['base_url'] ||= 'http://www.local-poets.org'
    when 'local'
      ENV['base_url'] = 'http://www.local-poets.org'
    when 'production'
      ENV['base_url'] = 'http://www.poets.org'
    end
  end

  config.before(:each) do
    @driver.manage.delete_all_cookies
  end

  config.verbose_retry = true # show retry status in spec process
  config.default_retry_count = 1

  config.after(:each) do |example|
    if ENV['host'] == 'saucelabs'
      # 'video-upload-on-pass': false
      if example.exception.nil?
        SauceWhisk::Jobs.pass_job @driver.session_id
      else
        SauceWhisk::Jobs.fail_job @driver.session_id
      end
    else 
      if example.exception.nil?
      else
        @driver.save_screenshot(File.join(Dir.pwd, "/errors/#{example.metadata[:full_description]}-#{page.generate_timestamp}.png")) 
      end
    end
    # uncomment to save screenshot on every test, not just on failure
    # else
    #   @driver.save_screenshot(File.join(Dir.pwd, "errors/visual-checks/#{example.metadata[:full_description]}-#{page.generate_timestamp}.png")) 
    # end
    @driver.quit
  end
end
