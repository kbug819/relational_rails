class ShelterResidents < ApplicationRecord

  def self.order_by_alphabetical
    self.all.order(family_name: :asc)
  end
end
