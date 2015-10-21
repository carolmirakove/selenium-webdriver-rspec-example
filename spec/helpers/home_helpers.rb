require_relative '../spec_helper'
require_relative '../../pages/home'
require_relative '../../pages/home_modal'
require_relative '../../pages/page'

module HomeHelpers

RSpec.configure do |config|
  config.before(:each) do
    @home = Home.new(@driver)
    @home_modal = HomeModal.new(@driver)
    @page = Page.new(@driver)
  end
end

  def load_home_page_and_close_modal
    page.load ''
    home.ui_elements do |ui_element|
      expect(page.ui_element_displayed?(ui_element)).to be_truthy
    end
    expect(home_modal.displayed?).to be_truthy
    home_modal.close_modal
  end

  def load_home_page_and_decline_modal
    page.load ''
    home.ui_elements do |ui_element|
      expect(page.ui_element_displayed?(ui_element)).to be_truthy
    end
    expect(home_modal.displayed?).to be_truthy
    home_modal.decline_modal
  end
end # HomeHelpers
