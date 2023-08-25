class Shelter < ApplicationRecord
  has_many :residents
  # validates_presence_of :shelter_name
  def self.order_by_creation
    self.all.order(created_at: :asc)
  end
end