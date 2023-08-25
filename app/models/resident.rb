class Resident < ApplicationRecord
  belongs_to :shelter

  def self.only_true
    Resident.where(long_term_housing_need: [true])
  end

  def self.order_by_alphabetical
    Resident.order(family_name: :asc)
  end

end