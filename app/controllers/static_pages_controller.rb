class StaticPagesController < ApplicationController
  def show
    @reviews = Review.all.order(created_at: :desc).limit(5)
    @top_books = Book.all.sort_by{|p| p.average_rate}.reverse.take(3)
  end
end
