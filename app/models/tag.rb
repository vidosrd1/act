class Tag < ApplicationRecord
  has_many :taggings, :dependent => :destroy
  validates :name, presence: true, uniqueness: true
  has_many :articles, :through => :taggings
end
