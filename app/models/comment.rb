class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_many :likes, as: :likeable, dependent: :destroy

  validates :description, presence: true, length: { maximum: 150 }
end