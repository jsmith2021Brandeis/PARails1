#Copied from March 12 Recitation COSI 166B
class User < ApplicationRecord
  has_secure_password
  before_save { self.email = email.downcase }
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_many :enrollments
  has_many :courses,through: :enrollments
end
