require_relative 'page'

class Global < Page

  # header
  HEADER_LOCATOR = { id: 'header' }
  LOGO_LOCATOR = { id: 'logo' }
  SEARCH_INPUT_LOCATOR = { name: 'search_block_form' }
  # social
  FACEBOOK_LINK_LOCATOR = { link: 'facebook' }
  TWITTER_LINK_LOCATOR = { link: 'twitter' }
  TUMBLR_LINK_LOCATOR = { link: 'tumbler' }
  YOUTUBE_LINK_LOCATOR = { link: 'youtube' }
  SOUNDCLOUD_LINK_LOCATOR = { link: 'cloud' }

  def ui_elements
    yield HEADER_LOCATOR
    yield LOGO_LOCATOR
    yield SEARCH_INPUT_LOCATOR
  end
  
  def submit_search_term(keyword)
    clear_then_enter keyword, SEARCH_INPUT_LOCATOR
    enter :enter, SEARCH_INPUT_LOCATOR
  end

  def click_social_icon_from_header(channel)
    case channel
    when 'facebook'
      click_within HEADER_LOCATOR, FACEBOOK_LINK_LOCATOR
    when 'twitter'
      click_within HEADER_LOCATOR, TWITTER_LINK_LOCATOR
    when 'tumblr'
      click_within HEADER_LOCATOR, TUMBLR_LINK_LOCATOR
    when 'youtube'
      click_within HEADER_LOCATOR, YOUTUBE_LINK_LOCATOR
    when 'soundcloud'
      click_within HEADER_LOCATOR, SOUNDCLOUD_LINK_LOCATOR
    end
  end
end # Global
