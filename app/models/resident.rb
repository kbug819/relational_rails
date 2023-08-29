class Resident < ApplicationRecord
  belongs_to :shelter

  validates_presence_of :family_name
  validates_presence_of :family_size
  validates :long_term_housing_need, inclusion: [true, false]

  def self.only_true
    Resident.where(long_term_housing_need: [true])
  end

  def self.order_by_alphabetical
    Resident.order(family_name: :asc)
  end

  def self.only_specific_family_size(family_size)
    where("family_size >= ?", family_size)
  end

end