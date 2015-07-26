require_relative 'spec_helper'
require_relative '../pages/home'

describe 'Home -' do

  let(:page) { Page.new(@driver) }
  let(:home) { Home.new(@driver) }

  it 'load page and verify UI elements', :smoke do
    page.load ''
    home.ui_elements do |ui_element|
      expect(page.ui_element_displayed?(ui_element)).to be_truthy
    end
  end

  it 'click logo and verify page title', :smoke do
    page.load ''
    home.click_logo
    expect(page.title).to eq('poets.org | Academy of American Poets')
  end

  it 'click Poem-A-Day About the Poem and back', :smoke do
    page.load ''
    home.click_poem_a_day_more    
    expect(home.about_the_poem_displayed?).to be_truthy
    home.click_poem_a_day_back_to_poem
    expect(home.poem_a_day_displayed?).to be_truthy
  end
end
