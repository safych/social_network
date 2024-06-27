class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@.+\.\S+\z/, message: :invalid }
  validates :phone, presence: true, uniqueness: true, format: { with: /\A\+?[1-9]\d{1,14}\z/, message: :invalid }
  validates :encrypted_password, presence: true
  validates :name, presence: true, format: { with: /\A.{1,30}\z/, message: :invalid }
  validates :surname, presence: true, format: { with: /\A.{1,30}\z/, message: :invalid }
  validates :born_on, presence: true
  validate :born_on_validation
  validates :username, presence: true, format: { with: /\A.{1,25}\z/, message: :invalid }
  validates :gender, presence: true, inclusion: { in: %w(man woman) }

  private

  def born_on_validation
    if born_on.present? && born_on > Date.today
      errors.add(:born_on, I18n.t("cannot_be_in_the_future"))
    end
  end
end
