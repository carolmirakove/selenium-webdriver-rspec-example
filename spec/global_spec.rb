require_relative 'spec_helper'
require_relative '../pages/global'

describe 'Global -' do

  let(:page) { Page.new(@driver) }
  let(:global) { Global.new(@driver) }

  it 'load home page and verify global page elements', :smoke do
    page.load ''
    global.ui_elements do |ui_element|
      expect(page.ui_element_displayed?(ui_element)).to be_truthy
    end
  end

  channels = [ 'facebook', 'twitter', 'tumblr', 'youtube', 'soundcloud' ]
  channels.each do |channel|
    it 'click social link from header', :focus, :social do
      page.load ''
      global.click_social_icon_from_header(channel)
      expect(page.title).to eq('poets.org | Academy of American Poets')
    end
  end
end
