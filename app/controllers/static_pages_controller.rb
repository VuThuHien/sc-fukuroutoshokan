class StaticPagesController < ApplicationController
  def show
    @reviews = Review.all.order(created_at: :desc).limit(5)
  end
  
  def about
  end
  
  def easter
  end
end
