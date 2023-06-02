class Restaurant < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, :address, :cuisine, presence: true
  def self.cuisines
    %w[italian japanese chinese french spanish belgian]
  end

  def self.cities
    %w[Rome Paris Madrid Barcelona Milan Berlin Amsterdam]
  end
  validates :cuisine, inclusion: {
    in: Restaurant.cuisines,
    message: " `%{value}` Is not a real cuisine
    Must be one of these #{Restaurant.cuisines.join(", ")}"
  }
end
