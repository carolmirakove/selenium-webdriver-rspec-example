require_relative 'spec_helper'
require_relative '../pages/global'

describe 'Global -' do
  include HomeHelpers

  let(:global) { Global.new(@driver) }
  let(:home) { Home.new(@driver) }
  let(:home_modal) { HomeModal.new(@driver) }
  let(:page) { Page.new(@driver) }

  it 'load home page and verify global page elements', :smoke do
    page.load ''
    global.ui_elements do |ui_element|
      expect(page.ui_element_displayed?(ui_element)).to be_truthy
    end
  end

  channels = [ 'facebook', 'twitter', 'tumblr', 'youtube', 'soundcloud' ]
  channels.each do |channel|
    it 'click social link from header', :social do
      load_home_page_and_decline_modal # HomeHelpers
      global.ui_elements do |ui_element|
        expect(page.ui_element_displayed?(ui_element)).to be_truthy
      end
      global.click_social_icon_from_header(channel)
      expect(page.title).to eq('poets.org | Academy of American Poets')
    end
  end
end
