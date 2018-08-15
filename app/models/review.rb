class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  has_many :photos
  has_many :comments, dependent: :destroy
  has_many :likes

  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :title, presence: true
end
