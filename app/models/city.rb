class City < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :vendors, uniq: true
  has_many :offers, through: :vendors
  has_many :categories, through: :offers, uniq: true

  def to_param
    name
  end
end
