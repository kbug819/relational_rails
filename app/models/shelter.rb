class Shelter < ApplicationRecord
  has_many :residents
  # validates_presence_of :shelter_name
end