class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :author_books, dependent: :destroy
  has_many :book_categories
  has_many :categories, through: :book_categories, dependent: :destroy
  has_many :rates
  has_many :reviews

  validates :title, presence: true
  
  mount_uploader :picture, ImagesUploader
end
