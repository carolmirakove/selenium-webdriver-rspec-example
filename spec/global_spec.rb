require_relative 'spec_helper'
require_relative '../pages/global'

describe 'Global' do

  before(:each) do
    @page = Page.new(@driver)
    @global = Global.new(@driver)
  end

  it 'load home page and verify global page elements', :smoke do
    @page.load ''
    @global.ui_elements do |ui_element|
      expect(@page.ui_element_displayed?(ui_element)).to be_truthy
    end
  end

  # header

  it 'click Facebook from header', :regression do
    @page.load ''
    @global.click_facebook_from_header
    expect(@page.title).to eq('The Academy of American Poets - New York, NY - Non-Profit Organization | Facebook')
  end

  it 'click Twitter from header', :regression do
    @page.load ''
    @global.click_twitter_from_header
    expect(@page.title).to eq('Poets.org (@POETSorg) | Twitter')
  end

  it 'click Tumblr from header', :regression do
    @page.load ''
    @global.click_tumblr_from_header
    expect(@page.title).to eq('POETS.org')
  end

  it 'click YouTube from header', :regression do
    @page.load ''
    @global.click_youtube_from_header
    expect(@page.title).to eq('Poets.org - YouTube')
  end

  # SoundCloud seems to rotate three different page titles, so we will match for an include rather than equal string
  it 'click SoundCloud from header', :regression do
    @page.load ''
    @global.click_soundcloud_from_header
    expect(@page.title).to include('Academy of American Poets\'s')
  end

  # footer
  # TODO

end
