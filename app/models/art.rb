class Art < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :lists
end
