module ApplicationHelper
  def full_title page_title = ""
    base_title = t "app_name"
    page_title.empty? ? base_title : "#{page_title} - #{base_title}"
  end
  
  def like review
    review.likes.find_by user_id: current_user.id
  end
  
  def author_rate(book, user)
    rates = book.rates.where(user_id: user.id)
    size = rates.size
    total = 0
    rates.each do |rate|
      total += rate.score
    end
    return total * 1.0 / size if size > 0
    0
  end

  def rate movie
    movie.rates.find_by user_id: current_user.id
  end

  def unread_notifications_count
    current_user.notifications.where(isRead: false).size
  end

  def my_notifications
    current_user.notifications.order(id: :desc).limit 5
  end

  def time_ago(date)
    time_ago_in_words(date)
  end
end
