class Shelter < ApplicationRecord
  has_many :residents
  # validates_presence_of :shelter_name
def order_by
  self.order(created_at: :desc)
end
end