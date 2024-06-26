class District < ApplicationRecord
  has_many :parks

  validates :name, presence: true
end
