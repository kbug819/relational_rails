class Resident < ApplicationRecord
  belongs_to :shelter

  def self.only_true
    Resident.where(long_term_housing_need: [true])
  end

  def self.order_by_alphabetical
    Resident.order(family_name: :asc)
  end

  def self.only_specific_family_size(family_size)
    where(family_size: [family_size])
  end

end