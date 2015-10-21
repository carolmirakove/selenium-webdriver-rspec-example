require_relative 'page'

class PADSignUpModal < Page

  MODAL_LOCATOR = { css: 'div#modalContent' }
  MODAL_FORM_CONTENT_LOCATOR = { css: 'form#-aap-main-cm-create-form-subscribe' }
  EMAIL_ADDRESS_INPUT_LOCATOR = { css: 'input#edit-form-subscribe' }
  CONTINUE_BUTTON_LOCATOR = { css: 'input#edit-next' }
  CLOSE_WINDOW_LINK_LOCATOR = { link: 'Close Window' }

  def displayed?
    is_displayed? MODAL_LOCATOR
    text_include 'Poem-a-Day', MODAL_FORM_CONTENT_LOCATOR
    text_include 'Sign up for previously unpublished poems by contemporary poets, as well as classic poems, delivered daily.', MODAL_FORM_CONTENT_LOCATOR
  end

  # In a real test environment I would write a method to both enter and submit 
  # an email address. The purpose of this method in this repo is to 
  # demonstrate how to create unique, dynamic test email address, 
  # not to verify the sign-up feature.
  def enter_email_address(email_address)
    enter_within email_address, MODAL_LOCATOR, EMAIL_ADDRESS_INPUT_LOCATOR 
  end

  def close_modal
    click CLOSE_WINDOW_LINK_LOCATOR
  end
end # PADSignUpModal
