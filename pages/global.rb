require_relative 'page'

class Global < Page

  # header
  HEADER_LOCATOR = { id: 'header' }
  LOGO_LOCATOR = { id: 'logo' }
  SEARCH_INPUT_LOCATOR = { id: 'edit-search-block-form--2' }
  # social
  FACEBOOK_LINK_LOCATOR = { link: 'facebook' }
  TWITTER_LINK_LOCATOR = { link: 'twitter' }
  TUMBLR_LINK_LOCATOR = { link: 'tumbler' }
  YOUTUBE_LINK_LOCATOR = { link: 'youtube' }
  SOUNDCLOUD_LINK_LOCATOR = { link: 'cloud' }
  # footer

  def ui_elements
    yield HEADER_LOCATOR
    yield LOGO_LOCATOR
    yield SEARCH_INPUT_LOCATOR
    # add footer
  end

  def click_facebook_from_header
    click_within HEADER_LOCATOR, FACEBOOK_LINK_LOCATOR
  end

  def click_twitter_from_header
    click_within HEADER_LOCATOR, TWITTER_LINK_LOCATOR
  end

  def click_tumblr_from_header
    click_within HEADER_LOCATOR, TUMBLR_LINK_LOCATOR
  end

  def click_youtube_from_header
    click_within HEADER_LOCATOR, YOUTUBE_LINK_LOCATOR
  end

  def click_soundcloud_from_header
    click_within HEADER_LOCATOR, SOUNDCLOUD_LINK_LOCATOR
  end

end # Global
