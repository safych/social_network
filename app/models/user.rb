class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validates :name, presence: true
  validates :surname, presence: true
  validates :age, presence: true, :inclusion => 1..100
  validates :nickname, presence: true
  validates :gender, presence: true, inclusion: { in: %w(man woman), 
                                                  message: "%{value} is not a valid gender" }
end
