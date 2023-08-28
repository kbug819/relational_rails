class Shelter < ApplicationRecord
  has_many :residents

  validates_presence_of :shelter_name
  validates_presence_of :address
  validates_presence_of :capasity
  validates :case_management_available, inclusion: [true, false]
  # validates_presence_of :shelter_name
  def self.order_by_creation
    self.all.order(created_at: :asc)
  end
end