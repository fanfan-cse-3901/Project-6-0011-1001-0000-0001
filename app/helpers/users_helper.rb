# File Edited on 07/31/2020 by Yifan Yao: Redesign rating as helper method and use it anywhere
module UsersHelper

  # Get average rating
  def avg_rating(user_id)
    get_avg_rating = "SELECT AVG(rating) FROM transactions
                      JOIN items ON transactions.item_id = items.id
                      WHERE items.user_id = #{user_id};"
    ActiveRecord::Base.connection.execute(get_avg_rating)[0]["AVG(rating)"]
  end

end
