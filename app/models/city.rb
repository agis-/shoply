class City < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }

  has_and_belongs_to_many :vendors, uniq: true
  has_many :offers, through: :vendors
  has_many :categories, through: :offers, uniq: true
end
