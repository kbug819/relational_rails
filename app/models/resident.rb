class Resident < ApplicationRecord
  belongs_to :shelter

  def self.only_true
    Resident.where(long_term_housing_need: [true])
  end

end