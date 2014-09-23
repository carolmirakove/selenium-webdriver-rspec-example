require_relative 'page'

class Home < Page

  LOGO_LOCATOR = { id: 'logo' }
  SEARCH_INPUT = { id: 'edit-search-block-form--2' }
  TOP_NAV_LINKS_LOCATOR = { css: 'div#block-menu-menu-quick-links-poets-org' }
  PRIZES_LINK_LOCATOR = { link: 'Prizes' }
  ADVERTISE_LINK_LOCATOR = { link: 'Advertise' }
  JOIN_LINK_LOCATOR = { link: 'Join the Academy' }
  SOCIAL_LINKS_LOCATOR = { css: 'div#block-aap-main-aap-follow-aap' }
  PAD_WRAPPER_LOCATOR = { css: 'div#poem-content-wrapper' }
  PAD_CONTENT_LOCATOR = { css: 'div#poem-content' }
  PAD_MORE_LINK_LOCATOR = { link: 'more' }
  PAD_ABOUT_LOCATOR = { css: 'div#options-wrapper' }
  PAD_POEM_LINK_LOCATOR = { link: 'poem' }


  def click_logo
    click LOGO_LOCATOR
  end

  def ui_elements
    yield LOGO_LOCATOR
    yield SEARCH_INPUT
    yield TOP_NAV_LINKS_LOCATOR
    yield SOCIAL_LINKS_LOCATOR
  end

  def click_advertise
    click_within TOP_NAV_LINKS_LOCATOR, ADVERTISE_LINK_LOCATOR
  end

  def click_poem_a_day_more
    click_within PAD_WRAPPER_LOCATOR, PAD_MORE_LINK_LOCATOR
  end

  def about_the_poem_displayed?
    is_displayed? PAD_ABOUT_LOCATOR
  end

  def click_poem_a_day_back_to_poem
    click_within PAD_ABOUT_LOCATOR, PAD_POEM_LINK_LOCATOR
  end

  def poem_a_day_displayed?
    is_displayed? PAD_CONTENT_LOCATOR
  end

end # Home
