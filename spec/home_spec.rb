require_relative 'spec_helper'
require_relative '../pages/home'

describe 'Home' do

  before(:each) do
    @page = Page.new(@driver)
    @home = Home.new(@driver)
  end

  it 'load page and verify title', :smoke do
    @page.load ''
    expect(@page.title).to eq('poets.org | Academy of American Poets')
  end

  it 'click logo and verify page elements', :smoke do
    @page.load ''
    @home.click_logo
    @home.ui_elements do |ui_element|
      expect(@page.ui_element_displayed?(ui_element)).to be_truthy
    end
  end

  it 'click Advertise', :regression do
    @page.load ''
    @home.click_advertise    
    expect(@page.title).to eq('Advertise With Us | Academy of American Poets')
  end

  it 'click Poem-A-Day About the Poem and back', :smoke do
    @page.load ''
    @home.click_poem_a_day_more    
    expect(@home.about_the_poem_displayed?).to be_truthy
    @home.click_poem_a_day_back_to_poem
    expect(@home.poem_a_day_displayed?).to be_truthy
  end

end
