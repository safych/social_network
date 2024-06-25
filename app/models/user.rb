class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@.+\.\S+\z/ }
  validates :phone, presence: true, uniqueness: true, format: { with: /\A\+?[1-9]\d{1,14}\z/ }
  validates :encrypted_password, presence: true
  validates :name, presence: true, format: { with: /\A.{1,30}\z/ }
  validates :surname, presence: true, format: { with: /\A.{1,30}\z/ }
  validates :born_on, presence: true
  validates :username, presence: true, format: { with: /\A.{1,25}\z/ }
  validates :gender, presence: true, inclusion: { in: %w(man woman), 
                                                  message: "%{value} is not a valid gender" }
end
