# File edited on 07/26/2020 by Prachiti Garge: Check if current user is seller
require 'kramdown'
module ApplicationHelper

  # To sanitize the content of message
  def markdown_to_html(text)
    Kramdown::Document.new(text).to_html
  end

  # To know seller
  def item_author(item)
    user_signed_in? && current_user.id == item.user_id
  end

end
