require_relative 'page'

class Home < Page

  # header
  LOGO_LOCATOR = { id: 'logo' }
  SEARCH_INPUT_LOCATOR = { id: 'edit-search-block-form--2' }
  TOP_NAV_LINKS_LOCATOR = { css: 'div#block-menu-menu-quick-links-poets-org' }
  PRIZES_LINK_LOCATOR = { link: 'Prizes' }
  ADVERTISE_LINK_LOCATOR = { link: 'Advertise' }
  JOIN_LINK_LOCATOR = { link: 'Join the Academy' }
  HEADER_BOTTOM_LOCATOR = { css: 'div#header-bottom-l' }
  # side nav
  # TODO
  # programs
  AAP_HOME_LINK_LOCATOR = { link: 'Academy of American Poets' }
  NPM_LINK_LOCATOR = { link: 'National Poetry Month' }
  MAGAZINE_LINK_LOCATOR = { link: 'American Poets Magazine' }
  # social
  FACEBOOK_LINK_LOCATOR = { link: 'facebook' }
  TWITTER_LINK_LOCATOR = { link: 'twitter' }
  TUMBLR_LINK_LOCATOR = { link: 'tumbler' }
  YOUTUBE_LINK_LOCATOR = { link: 'youtube' }
  SOUNDCLOUD_LINK_LOCATOR = { link: 'cloud' }
  # body
  SOCIAL_LINKS_BLOCK_LOCATOR = { css: 'div#block-aap-main-aap-follow-aap' }
  PAD_WRAPPER_LOCATOR = { css: 'div#poem-content-wrapper' }
  PAD_CONTENT_LOCATOR = { css: 'div#poem-content' }
  PAD_MORE_LINK_LOCATOR = { link: 'more' }
  PAD_ABOUT_LOCATOR = { css: 'div#options-wrapper' }
  PAD_POEM_LINK_LOCATOR = { link: 'poem' }
  # footer
  # TODO

  def click_logo
    click LOGO_LOCATOR
  end

  def ui_elements
    yield TOP_NAV_LINKS_LOCATOR
    yield HEADER_BOTTOM_LOCATOR
    yield SOCIAL_LINKS_BLOCK_LOCATOR
    yield PAD_CONTENT_LOCATOR
  end

  # header
  
  def click_prizes
    click_within TOP_NAV_LINKS_LOCATOR, PRIZES_LINK_LOCATOR
  end

  def click_advertise
    click_within TOP_NAV_LINKS_LOCATOR, ADVERTISE_LINK_LOCATOR
  end

  def click_join
    click_within TOP_NAV_LINKS_LOCATOR, JOIN_LINK_LOCATOR
  end

  # header bottom

  def click_aap_home_from_header_bottom
    click_within HEADER_BOTTOM_LOCATOR, AAP_HOME_LINK_LOCATOR
  end

  def click_npm_from_header_bottom
    click_within HEADER_BOTTOM_LOCATOR, NPM_LINK_LOCATOR
  end

  def click_magazine_from_header_bottom
    click_within HEADER_BOTTOM_LOCATOR, MAGAZINE_LINK_LOCATOR
  end

  # poem-a-day

  def poem_a_day_displayed?
    is_displayed? PAD_CONTENT_LOCATOR
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

end # Home
