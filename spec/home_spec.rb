require_relative 'spec_helper'
require_relative '../pages/home'

describe 'Home' do

  before(:each) do
    @page = Page.new(@driver)
    @home = Home.new(@driver)
  end

  it 'load page and verify UI elements', :smoke do
    @page.load ''
    @home.ui_elements do |ui_element|
      expect(@page.ui_element_displayed?(ui_element)).to be_truthy
    end
  end

  it 'click logo and verify page title', :smoke do
    @page.load ''
    @home.click_logo
    expect(@page.title).to eq('poets.org | Academy of American Poets')
  end

  # header

  it 'click Prizes', :regression do
    @page.load ''
    @home.click_prizes    
    expect(@page.title).to eq('american poets prizes | Academy of American Poets')
  end

  it 'click Advertise', :regression do
    @page.load ''
    @home.click_advertise    
    expect(@page.title).to eq('Advertise With Us | Academy of American Poets')
  end

  it 'click Join the Academy', :regression do
    @page.load ''
    @home.click_join    
    expect(@page.title).to eq('2014 Membership Form - Academy of American Poets')
  end

  # header bottom

  it 'click Academy of American Poets Home from header bottom', :regression do
    @page.load ''
    @home.click_aap_home_from_header_bottom
    expect(@page.title).to eq('Academy of American Poets | Academy of American Poets')
  end

  it 'click National Poetry Month from header bottom', :regression do
    @page.load ''
    @home.click_npm_from_header_bottom
    expect(@page.title).to eq('National Poetry Month | Academy of American Poets')
  end

  it 'click American Poets Magazine from header bottom', :regression do
    @page.load ''
    @home.click_magazine_from_header_bottom
    expect(@page.title).to eq('Spring-Summer 2014 | Academy of American Poets')
  end

  # header side nav
  # TODO

  # poem-a-day

  it 'click Poem-A-Day About the Poem and back', :smoke do
    @page.load ''
    @home.click_poem_a_day_more    
    expect(@home.about_the_poem_displayed?).to be_truthy
    @home.click_poem_a_day_back_to_poem
    expect(@home.poem_a_day_displayed?).to be_truthy
  end

end
