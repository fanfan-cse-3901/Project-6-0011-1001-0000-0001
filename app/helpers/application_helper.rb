# File edited on 07/26/2020 by Prachiti Garge: Check if current user is seller
require 'kramdown'
module ApplicationHelper

  def gravatar_for(user, options = { size: 200})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.full_name, class: "border-radius-50")
  end

  def markdown_to_html(text)
    Kramdown::Document.new(text, input: "GFM").to_html
  end

  def item_author(item)
    user_signed_in? && current_user.id == item.user_id
  end

end
