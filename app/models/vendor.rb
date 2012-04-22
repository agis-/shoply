class Vendor < ActiveRecord::Base
  attr_accessible :name, :username, :email, :password, :password_confirmation

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :email, presence: true
  validates :username, presence: true
  validates :password, presence: true

  has_many :offers, dependent: :destroy
  has_many :categories, through: :offers, uniq: true
  has_and_belongs_to_many :cities, uniq: true

  has_secure_password
end