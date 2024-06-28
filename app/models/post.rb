class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  has_one_attached :avatar

  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true
end