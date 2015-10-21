require_relative 'page'

class HomeModal < Page

  MODAL_LOCATOR = { css: 'div#aap-social-splash-content' }
  CLOSE_BUTTON_LOCATOR = { css: 'a.ui-dialog-titlebar-close' }
  NO_THANK_YOU_BUTTON_LOCATOR = { css: 'div.ui-dialog-buttonpane button.ui-button' }

  def displayed?
    is_displayed? MODAL_LOCATOR
  end

  def close_modal
    click CLOSE_BUTTON_LOCATOR
  end

  def decline_modal
    click NO_THANK_YOU_BUTTON_LOCATOR
  end
end # HomeModal