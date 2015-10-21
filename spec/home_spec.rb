require_relative 'spec_helper'
require_relative '../pages/home'
require_relative '../pages/pad_sign_up_modal'

describe 'Home -' do
  include HomeHelpers

  let(:home) { Home.new(@driver) }
  let(:home_modal) { HomeModal.new(@driver) }
  let(:pad_sign_up_modal) { PADSignUpModal.new(@driver) }
  let(:page) { Page.new(@driver) }
  
  it 'load page and verify UI elements', :smoke do
    page.load ''
    home.ui_elements do |ui_element|
      expect(page.ui_element_displayed?(ui_element)).to be_truthy
    end
  end

  it 'click logo and verify page title' do
    load_home_page_and_close_modal # HomeHelpers
    home.click_logo
    expect(page.title).to eq('poets.org | Academy of American Poets')
  end

  it 'click Poem-A-Day About the Poem and back', :smoke do
    load_home_page_and_decline_modal # HomeHelpers
    home.click_poem_a_day_more
    expect(home.about_the_poem_displayed?).to be_truthy
    home.click_poem_a_day_back_to_poem
    expect(home.poem_a_day_displayed?).to be_truthy
  end

  # The purpose of this spec in this repo is to demonstrate 
  # how to generate a new, unique email address for testing.
  # In a real test environment the modal would be submitted
  # rather than closed.
  it 'click sign up for Poem-A-Day and generate a unique email address', :smoke do
    timestamp = page.generate_timestamp
    email_address = "carol+#{timestamp}@email-address.example"

    load_home_page_and_decline_modal # HomeHelpers
    home.click_poem_a_day_sign_up
    expect(pad_sign_up_modal.displayed?).to be_truthy
    pad_sign_up_modal.enter_email_address(email_address)
    pad_sign_up_modal.close_modal
  end
end
