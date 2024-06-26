class Park < ApplicationRecord
  belongs_to :location
  belongs_to :neighbourhood
  belongs_to :district

  validates :name, presence: true
  validates :cca, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[cca created_at district_id id location_id name neighbourhood_id updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[district location neighbourhood]
  end
end
