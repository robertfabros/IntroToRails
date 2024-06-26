class Location < ApplicationRecord
  has_many :parks

  validates :description, presence: true
end
