class Book < ApplicationRecord
  attr_accessor :average_rate
  
  has_many :author_books
  has_many :authors, through: :author_books, dependent: :destroy
  has_many :book_categories
  has_many :categories, through: :book_categories, dependent: :destroy
  has_many :rates
  has_many :reviews

  validates :title, presence: true
  
  mount_uploader :picture, ImagesUploader
  
  def average_rate
    book = Book.find_by id: self.id
    rates = book.rates
    size = rates.size
    total = 0
    rates.each do |rate|
      total += rate.score
    end
    return total * 1.0 / size if size > 0
    0
  end
end
